//
//  UpcomingMoviesViewModel.swift
//  Movies
//
//  Created by Adam Young on 26/09/2024.
//

import Foundation
import MoviesDomain
import Observation

@Observable
@MainActor
final class UpcomingMoviesViewModel: MovieCollectionViewModel {

    struct Dependencies: Sendable {
        var fetchUpcomingMovies: @Sendable (Int, Bool) async throws -> [Movie]

        init(fetchUpcomingMovies: @Sendable @escaping (Int, Bool) async throws -> [Movie]) {
            self.fetchUpcomingMovies = fetchUpcomingMovies
        }
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init(
            dependencies: MovieCollectionViewModel.Dependencies(
                fetchMovies: dependencies.fetchUpcomingMovies
            )
        )
    }

}

extension UpcomingMoviesViewModel.Dependencies {

    static func mock(movies: [Movie] = Movie.mocks) -> Self {
        .init(
            fetchUpcomingMovies: { page, _ in
                guard page == 1 else {
                    return []
                }

                return movies
            }
        )
    }

}
