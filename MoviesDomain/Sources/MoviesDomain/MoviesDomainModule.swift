//
//  MoviesDomainModule.swift
//  MoviesDomain
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation

public class MoviesDomainModule {

    public struct Dependencies {

        let movieRepository: @Sendable () -> any MovieRepository

        public init(movieRepository: @Sendable @escaping () -> some MovieRepository) {
            self.movieRepository = movieRepository
        }

    }

    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

}

public extension MoviesDomainModule {

    func fetchMovieUseCase() -> some FetchMovieUseCase {
        let movieRepository = dependencies.movieRepository()

        return FetchMovie(movieRepository: movieRepository, locale: locale())
    }

    func fetchPopularMoviesUseCase() -> some FetchPopularMoviesUseCase {
        let movieRepository = dependencies.movieRepository()

        return FetchPopularMovies(movieRepository: movieRepository, locale: locale())
    }

    func fetchNowPlayingMoviesUseCase() -> some FetchNowPlayingMoviesUseCase {
        let movieRepository = dependencies.movieRepository()

        return FetchNowPlayingMovies(movieRepository: movieRepository, locale: locale())
    }

    func fetchTopRatedMoviesUseCase() -> some FetchTopRatedMoviesUseCase {
        let movieRepository = dependencies.movieRepository()

        return FetchTopRatedMovies(movieRepository: movieRepository, locale: locale())
    }

    func fetchUpcomingMoviesUseCase() -> some FetchUpcomingMoviesUseCase {
        let movieRepository = dependencies.movieRepository()

        return FetchUpcomingMovies(movieRepository: movieRepository, locale: locale())
    }

}

extension MoviesDomainModule {

    private func locale() -> Locale {
        .current
    }

}
