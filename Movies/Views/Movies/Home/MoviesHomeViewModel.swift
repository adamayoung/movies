//
//  MoviesHomeViewModel.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesDomain
import Observation

@Observable
@MainActor
final class MoviesHomeViewModel {

    struct Dependencies: Sendable {
        var fetchPopularMovies: @Sendable (Int) async throws -> [Movie]
        var fetchNowPlayingMovies: @Sendable (Int) async throws -> [Movie]
        var fetchUpcomingMovies: @Sendable (Int) async throws -> [Movie]
        var fetchTopRatedMovies: @Sendable (Int) async throws -> [Movie]

        init(
            fetchPopularMovies: @Sendable @escaping (Int) async throws -> [Movie],
            fetchNowPlayingMovies: @Sendable @escaping (Int) async throws -> [Movie],
            fetchUpcomingMovies: @Sendable @escaping (Int) async throws -> [Movie],
            fetchTopRatedMovies: @Sendable @escaping (Int) async throws -> [Movie]
        ) {
            self.fetchPopularMovies = fetchPopularMovies
            self.fetchNowPlayingMovies = fetchNowPlayingMovies
            self.fetchUpcomingMovies = fetchUpcomingMovies
            self.fetchTopRatedMovies = fetchTopRatedMovies
        }
    }

    private(set) var popularMovies = [Movie]()
    private(set) var nowPlayingMovies = [Movie]()
    private(set) var upcomingMovies = [Movie]()
    private(set) var topRatedMovies = [Movie]()

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func fetchData() async {
        do {
            async let popularMovies = dependencies.fetchPopularMovies(1)
            async let nowPlayingMovies = dependencies.fetchNowPlayingMovies(1)
            async let upcomingMovies = dependencies.fetchUpcomingMovies(1)
            async let topRatedMovies = dependencies.fetchTopRatedMovies(1)

            self.popularMovies = try await Array(popularMovies.prefix(8))
            self.nowPlayingMovies = try await Array(nowPlayingMovies.prefix(8))
            self.upcomingMovies = try await Array(upcomingMovies.prefix(8))
            self.topRatedMovies = try await Array(topRatedMovies.prefix(8))
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

}

extension MoviesHomeViewModel.Dependencies {

    static var mock: Self {
        .init(
            fetchPopularMovies: { page in
                guard page == 1 else {
                    return []
                }

                return Movie.mocks
            },
            fetchNowPlayingMovies: { page in
                guard page == 1 else {
                    return []
                }

                return Movie.mocks
            },
            fetchUpcomingMovies: { page in
                guard page == 1 else {
                    return []
                }

                return Movie.mocks
            },
            fetchTopRatedMovies: { page in
                guard page == 1 else {
                    return []
                }

                return Movie.mocks
            }
        )
    }

}
