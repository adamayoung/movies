//
//  DIContainer.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesData
import MoviesDomain

final class DIContainer {

    static let shared = DIContainer()

    private lazy var dataModule: MoviesDataModule = .init(
        dependencies: MoviesDataModule.Dependencies(
            tmdbAPIKey: "cf458964ba75aa9d53a21578df3747ed"
        )
    )

    private lazy var domainModule: MoviesDomainModule = .init(
        dependencies: MoviesDomainModule.Dependencies(
            movieRepository: {
                self.dataModule.movieRepository()
            }
        )
    )

    private init() {}

}

extension DIContainer {

    func moviesHome() -> MoviesHomeViewModel.Dependencies {
        let fetchPopularMoviesUseCase = domainModule.fetchPopularMoviesUseCase()
        let fetchNowPlayingMoviesUseCase = domainModule.fetchNowPlayingMoviesUseCase()
        let fetchUpcomingMoviesUseCase = domainModule.fetchUpcomingMoviesUseCase()
        let fetchTopRatedMoviesUseCase = domainModule.fetchTopRatedMoviesUseCase()

        return .init(
            fetchPopularMovies: { page in
                try await fetchPopularMoviesUseCase.execute(page: page)
            },
            fetchNowPlayingMovies: { page in
                try await fetchNowPlayingMoviesUseCase.execute(page: page)
            },
            fetchUpcomingMovies: { page in
                try await fetchUpcomingMoviesUseCase.execute(page: page)
            },
            fetchTopRatedMovies: { page in
                try await fetchTopRatedMoviesUseCase.execute(page: page)
            }
        )
    }

    func popularMovies() -> PopularMoviesViewModel.Dependencies {
        let fetchPopularMoviesUseCase = domainModule.fetchPopularMoviesUseCase()

        return .init(
            fetchPopularMovies: { page, ignoringCache in
                try await fetchPopularMoviesUseCase.execute(page: page, ignoringCache: ignoringCache)
            }
        )
    }

    func nowPlayingMovies() -> NowPlayingMoviesViewModel.Dependencies {
        let fetchNowPlayingMoviesUseCase = domainModule.fetchNowPlayingMoviesUseCase()

        return .init(
            fetchNowPlayingMovies: { page, ignoringCache in
                try await fetchNowPlayingMoviesUseCase.execute(page: page, ignoringCache: ignoringCache)
            }
        )
    }

    func topRatedMovies() -> TopRatedMoviesViewModel.Dependencies {
        let fetchTopRatedMoviesUseCase = domainModule.fetchTopRatedMoviesUseCase()

        return .init(
            fetchTopRatedMovies: { page, ignoringCache in
                try await fetchTopRatedMoviesUseCase.execute(page: page, ignoringCache: ignoringCache)
            }
        )
    }

    func upcomingMovies() -> UpcomingMoviesViewModel.Dependencies {
        let fetchUpcomingMoviesUseCase = domainModule.fetchUpcomingMoviesUseCase()

        return .init(
            fetchUpcomingMovies: { page, ignoringCache in
                try await fetchUpcomingMoviesUseCase.execute(page: page, ignoringCache: ignoringCache)
            }
        )
    }

    func movie() -> MovieViewModel.Dependencies {
        let fetchMovieUseCase = domainModule.fetchMovieUseCase()

        return .init(
            fetchMovie: { id in
                try await fetchMovieUseCase.execute(id: id)
            }
        )
    }

}
