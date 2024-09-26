//
//  MovieCollectionViewModel.swift
//  Movies
//
//  Created by Adam Young on 26/09/2024.
//

import Foundation
import MoviesDomain
import Observation

@Observable
@MainActor
class MovieCollectionViewModel {

    struct Dependencies: Sendable {
        var fetchMovies: @Sendable (Int, Bool) async throws -> [Movie]

        init(fetchMovies: @Sendable @escaping (Int, Bool) async throws -> [Movie]) {
            self.fetchMovies = fetchMovies
        }
    }

    private(set) var movies: [Movie]?
    private(set) var showLoadingIndicator = false
    private(set) var isContentAvailable = true

    private let dependencies: Dependencies

    private(set) var isFetching = false
    private var currentPage = 1
    private var moreMoviesAvailable = false

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func fetchData() async {
        guard !isFetching else {
            return
        }

        isFetching = true
        showLoadingIndicator = movies == nil
        currentPage = 1

        let ignoreCache = movies != nil
        do {
            movies = try await dependencies.fetchMovies(currentPage, ignoreCache)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }

        isFetching = false
        showLoadingIndicator = false
        isContentAvailable = movies != []
    }

    func fetchNextPage() async {
        guard !moreMoviesAvailable, !isFetching else {
            return
        }

        isFetching = true
        defer {
            isFetching = false
        }

        do {
            let nextPageOfMovies = try await dependencies.fetchMovies(currentPage + 1, false)
            let filteredMovies = nextPageOfMovies.filter { movie in
                !(movies ?? []).contains(movie)
            }

            if nextPageOfMovies.isEmpty {
                moreMoviesAvailable = false
                return
            }

            movies?.append(contentsOf: filteredMovies)
            currentPage += 1
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

}

extension MovieCollectionViewModel.Dependencies {

    static func mock(movies: [Movie] = Movie.mocks) -> Self {
        .init(
            fetchMovies: { page, _ in
                guard page == 1 else {
                    return []
                }

                return movies
            }
        )
    }

}
