//
//  PopularMoviesViewModel.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesDomain
import Observation

@Observable
@MainActor
final class PopularMoviesViewModel: MovieCollectionViewModel {

    struct Dependencies: Sendable {
        var fetchPopularMovies: @Sendable (Int, Bool) async throws -> [Movie]

        init(fetchPopularMovies: @Sendable @escaping (Int, Bool) async throws -> [Movie]) {
            self.fetchPopularMovies = fetchPopularMovies
        }
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init(
            dependencies: MovieCollectionViewModel.Dependencies(
                fetchMovies: dependencies.fetchPopularMovies
            )
        )
    }

}

extension PopularMoviesViewModel.Dependencies {

    static func mock(movies: [Movie] = Movie.mocks) -> Self {
        .init(
            fetchPopularMovies: { page, _ in
                guard page == 1 else {
                    return []
                }

                return movies
            }
        )
    }

}
