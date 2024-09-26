//
//  FetchUpcomingMovies.swift
//  MoviesDomain
//
//  Created by Adam Young on 26/09/2024.
//

import Foundation

final class FetchUpcomingMovies: FetchUpcomingMoviesUseCase {

    private let movieRepository: any MovieRepository
    private let locale: Locale

    init(movieRepository: some MovieRepository, locale: Locale) {
        self.movieRepository = movieRepository
        self.locale = locale
    }

    func execute(page: Int) async throws(FetchUpcomingMoviesError) -> [Movie] {
        try await execute(page: page, ignoringCache: false)
    }

    func execute(page: Int, ignoringCache: Bool) async throws(FetchUpcomingMoviesError) -> [Movie] {
        let movies: [Movie]
        do {
            movies = try await movieRepository.upcoming(
                page: page,
                country: locale.region?.identifier,
                language: locale.language.languageCode?.identifier,
                ignoringCache: ignoringCache
            )
        } catch {
            throw .unknown
        }

        return movies
    }

}
