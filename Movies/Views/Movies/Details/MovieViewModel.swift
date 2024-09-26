//
//  MovieViewModel.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesDomain
import Observation

@Observable
@MainActor
final class MovieViewModel {

    struct Dependencies: Sendable {
        var fetchMovie: @Sendable (Movie.ID) async throws -> Movie

        init(fetchMovie: @Sendable @escaping (Movie.ID) async throws -> Movie) {
            self.fetchMovie = fetchMovie
        }
    }

    let movieID: Movie.ID

    private(set) var movie: Movie?

    private let dependencies: Dependencies

    init(movieID: Movie.ID, dependencies: Dependencies) {
        self.movieID = movieID
        self.dependencies = dependencies
    }

    convenience init(movie: Movie, dependencies: Dependencies) {
        self.init(movieID: movie.id, dependencies: dependencies)
        self.movie = movie
    }

    func fetchData() async {
        do {
            movie = try await dependencies.fetchMovie(movieID)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

}

extension MovieViewModel.Dependencies {

    static var mock: Self {
        .init(
            fetchMovie: { _ in
                Movie.alienRomulus
            }
        )
    }

}
