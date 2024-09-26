//
//  TopRatedMoviesViewModel.swift
//  Movies
//
//  Created by Adam Young on 26/09/2024.
//

import Foundation
import MoviesDomain
import Observation

@Observable
@MainActor
final class TopRatedMoviesViewModel: MovieCollectionViewModel {

    struct Dependencies: Sendable {
        var fetchTopRatedMovies: @Sendable (Int, Bool) async throws -> [Movie]

        init(fetchTopRatedMovies: @Sendable @escaping (Int, Bool) async throws -> [Movie]) {
            self.fetchTopRatedMovies = fetchTopRatedMovies
        }
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init(
            dependencies: MovieCollectionViewModel.Dependencies(
                fetchMovies: dependencies.fetchTopRatedMovies
            )
        )
    }

}

extension TopRatedMoviesViewModel.Dependencies {

    static func mock(movies: [Movie] = Movie.mocks) -> Self {
        .init(
            fetchTopRatedMovies: { page, _ in
                guard page == 1 else {
                    return []
                }

                return movies
            }
        )
    }

}
