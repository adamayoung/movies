//
//  MoviesDataModule.swift
//  MoviesDomain
//
//  Created by Adam Young on 25/09/2024.
//

import CachingStore
import Foundation
import MoviesDomain
import TMDb

public class MoviesDataModule {

    public struct Dependencies {

        let tmdbClient: TMDbClient

        public init(tmdbAPIKey: String) {
            self.tmdbClient = TMDbClient(apiKey: tmdbAPIKey)
        }

    }

    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

}

public extension MoviesDataModule {

    func movieRepository() -> some MovieRepository {
        let movieDataProvider = movieDataProvider()
        let movieCacheProvider = movieCacheProvider()

        return MovieDefaultRepository(
            movieDataProvider: movieDataProvider,
            movieCacheProvider: movieCacheProvider
        )
    }

}

extension MoviesDataModule {

    private func movieDataProvider() -> some MovieDataProvider {
        MovieTMDbDataProvider(
            movieService: dependencies.tmdbClient.movies,
            configurationService: dependencies.tmdbClient.configurations
        )
    }

    private func movieCacheProvider() -> some MovieCacheProvider {
        MovieCachingStoreProvider(cache: Self.cache)
    }

}

extension MoviesDataModule {

    private static let cache: some KeyValueCache = KeyValueInMemoryCache()
}
