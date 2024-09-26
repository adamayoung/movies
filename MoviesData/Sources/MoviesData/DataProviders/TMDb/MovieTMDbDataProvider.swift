//
//  MovieTMDbDataProvider.swift
//  MoviesData
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesDomain
import TMDb

final class MovieTMDbDataProvider: MovieDataProvider, Sendable {

    private let movieService: any MovieService
    private let configurationService: any ConfigurationService

    init(
        movieService: some MovieService,
        configurationService: some ConfigurationService
    ) {
        self.movieService = movieService
        self.configurationService = configurationService
    }

    func movie(withID id: MoviesDomain.Movie.ID, language _: String?) async throws -> MoviesDomain.Movie {
        let imagesConfiguration = try await configurationService.apiConfiguration().images

        let tmdbMovie = try await movieService.details(forMovie: id)

        let tmdbLogoMetadata = try await movieService.images(forMovie: id, filter: .init(languages: ["en"])).logos.first

        let movie = MovieMapper.map(
            from: tmdbMovie,
            logoPath: tmdbLogoMetadata?.filePath,
            imagesConfiguration: imagesConfiguration
        )

        return movie
    }

    func movies(withIDs ids: [MoviesDomain.Movie.ID], language: String?) async throws -> [MoviesDomain.Movie] {
        let moviesDict: [MoviesDomain.Movie.ID: MoviesDomain.Movie] = try await withThrowingTaskGroup(
            of: MoviesDomain.Movie.self) { [weak self] group in
                guard let self else {
                    return [:]
                }

                for id in ids {
                    group.addTask {
                        try await self.movie(withID: id, language: language)
                    }
                }

                var moviesDict = [MoviesDomain.Movie.ID: MoviesDomain.Movie]()

                for try await movie in group {
                    moviesDict[movie.id] = movie
                }

                return moviesDict
            }

        let movies = ids.compactMap { moviesDict[$0] }

        return movies
    }

    func popular(page: Int, country: String?, language: String?) async throws -> [MoviesDomain.Movie] {
        let movieListItems = try await movieService.popular(page: page, country: country, language: language).results
        let movieIDs = movieListItems.map(\.id)
        let movies = try await movies(withIDs: movieIDs, language: language)

        return movies
    }

    func nowPlaying(page: Int, country: String?, language: String?) async throws -> [MoviesDomain.Movie] {
        let movieListItems = try await movieService.nowPlaying(page: page, country: country, language: language).results
        let movieIDs = movieListItems.map(\.id)
        let movies = try await movies(withIDs: movieIDs, language: language)

        return movies
    }

    func topRated(page: Int, country: String?, language: String?) async throws -> [MoviesDomain.Movie] {
        let movieListItems = try await movieService.topRated(page: page, country: country, language: language).results
        let movieIDs = movieListItems.map(\.id)
        let movies = try await movies(withIDs: movieIDs, language: language)

        return movies
    }

    func upcoming(page: Int, country: String?, language: String?) async throws -> [MoviesDomain.Movie] {
        let movieListItems = try await movieService.upcoming(page: page, country: country, language: language).results
        let movieIDs = movieListItems.map(\.id)
        let movies = try await movies(withIDs: movieIDs, language: language)

        return movies
    }

}
