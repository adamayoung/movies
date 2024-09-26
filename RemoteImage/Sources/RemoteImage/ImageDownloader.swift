//
//  ImageDownloader.swift
//  RemoteImage
//
//  Created by Adam Young on 23/09/2024.
//

#if canImport(UIKit)
    import Foundation
    import UIKit

    public actor ImageDownloader {

        private let urlSession: URLSession
        private let cache: any KeyValueCache

        public init(urlSession: URLSession = .shared) {
            let cache = KeyValueInMemoryCache()
            self.init(urlSession: urlSession, cache: cache)
        }

        init(
            urlSession: URLSession,
            cache: some KeyValueCache
        ) {
            self.urlSession = urlSession
            self.cache = cache
        }

        @discardableResult
        public func download(url: URL) async -> UIImage? {
            let key = url.absoluteString

            if let status: LoaderStatus = await cache.get(forKey: key) {
                switch status {
                case let .fetched(image):
                    print("Cache HIT: \(url.absoluteString)")
                    return image

                case let .inProgress(task):
                    return await task.value
                }
            }

            print("Cache MISS: \(url.absoluteString)")

            let task: Task<UIImage?, Never> = Task {
                try? await downloadImage(from: url)
            }

            await cache.set(LoaderStatus.inProgress(task), forKey: key)

            let image = await task.value

            if let image {
                await cache.set(LoaderStatus.fetched(image), forKey: key)
            }

            return image
        }

    }

    extension ImageDownloader {

        private func downloadImage(from url: URL) async throws -> UIImage? {
            let (imageData, _) = try await urlSession.data(from: url)
            let image = UIImage(data: imageData)
            return image
        }

    }

    extension ImageDownloader {

        private enum LoaderStatus {
            case inProgress(Task<UIImage?, Never>)
            case fetched(UIImage)
        }

    }

    extension UIImage: Sendable {}
#endif
