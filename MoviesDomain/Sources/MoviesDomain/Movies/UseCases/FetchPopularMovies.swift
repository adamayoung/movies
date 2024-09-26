//
//  FetchPopularMovies.swift
//  MoviesDomain
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation

final class FetchPopularMovies: FetchPopularMoviesUseCase {

    private let movieRepository: any MovieRepository
    private let locale: Locale

    init(movieRepository: some MovieRepository, locale: Locale) {
        self.movieRepository = movieRepository
        self.locale = locale
    }

    func execute(page: Int) async throws(FetchPopularMoviesError) -> [Movie] {
        try await execute(page: page, ignoringCache: false)
    }

    func execute(page: Int, ignoringCache: Bool) async throws(FetchPopularMoviesError) -> [Movie] {
        let movies: [Movie]
        do {
            movies = try await movieRepository.popular(
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
