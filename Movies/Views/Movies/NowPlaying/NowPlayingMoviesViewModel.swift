//
//  NowPlayingMoviesViewModel.swift
//  Movies
//
//  Created by Adam Young on 26/09/2024.
//

import Foundation
import MoviesDomain
import Observation

@Observable
@MainActor
final class NowPlayingMoviesViewModel: MovieCollectionViewModel {

    struct Dependencies: Sendable {
        var fetchNowPlayingMovies: @Sendable (Int, Bool) async throws -> [Movie]

        init(fetchNowPlayingMovies: @Sendable @escaping (Int, Bool) async throws -> [Movie]) {
            self.fetchNowPlayingMovies = fetchNowPlayingMovies
        }
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init(
            dependencies: MovieCollectionViewModel.Dependencies(
                fetchMovies: dependencies.fetchNowPlayingMovies
            )
        )
    }

}

extension NowPlayingMoviesViewModel.Dependencies {

    static func mock(movies: [Movie] = Movie.mocks) -> Self {
        .init(
            fetchNowPlayingMovies: { page, _ in
                guard page == 1 else {
                    return []
                }

                return movies
            }
        )
    }

}
