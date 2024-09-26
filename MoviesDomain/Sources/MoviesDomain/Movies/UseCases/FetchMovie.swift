//
//  FetchMovie.swift
//  MoviesDomain
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation

final class FetchMovie: FetchMovieUseCase {

    private let movieRepository: any MovieRepository
    private let locale: Locale

    init(movieRepository: some MovieRepository, locale: Locale) {
        self.movieRepository = movieRepository
        self.locale = locale
    }

    func execute(id: Movie.ID) async throws(FetchMovieError) -> Movie {
        let movie: Movie
        do {
            movie = try await movieRepository.movie(
                withID: id,
                language: locale.language.languageCode?.identifier
            )
        } catch {
            throw .notFound
        }

        return movie
    }

}
