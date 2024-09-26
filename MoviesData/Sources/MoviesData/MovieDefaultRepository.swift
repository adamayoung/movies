//
//  MovieDefaultRepository.swift
//  MoviesData
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesDomain

final class MovieDefaultRepository: MovieRepository {

    private let movieDataProvider: any MovieDataProvider
    private let movieCacheProvider: any MovieCacheProvider

    init(
        movieDataProvider: some MovieDataProvider,
        movieCacheProvider: some MovieCacheProvider
    ) {
        self.movieDataProvider = movieDataProvider
        self.movieCacheProvider = movieCacheProvider
    }

    func movie(withID id: Movie.ID, language: String?) async throws(MovieRepositoryError) -> Movie {
        if let cachedMovie = await movieCacheProvider.movie(withID: id) {
            return cachedMovie
        }

        let movie: Movie
        do {
            movie = try await movieDataProvider.movie(withID: id, language: language)
        } catch {
            throw .unknown
        }

        await movieCacheProvider.setMovie(movie, withID: movie.id)

        return movie
    }

    func popular(
        page: Int,
        country: String?,
        language: String?,
        ignoringCache: Bool
    ) async throws(MovieRepositoryError) -> [Movie] {
        if !ignoringCache, let cachedMovies = await movieCacheProvider.popular(page: page) {
            return cachedMovies
        }

        if ignoringCache {
            await movieCacheProvider.removePopular()
        }

        let movies: [Movie]
        do {
            movies = try await movieDataProvider.popular(page: page, country: country, language: language)
        } catch {
            throw .unknown
        }

        await movieCacheProvider.setPopular(movies, page: page)

        return movies
    }

    func nowPlaying(
        page: Int,
        country: String?,
        language: String?,
        ignoringCache: Bool
    ) async throws(MovieRepositoryError) -> [Movie] {
        if !ignoringCache, let cachedMovies = await movieCacheProvider.nowPlaying(page: page) {
            return cachedMovies
        }

        if ignoringCache {
            await movieCacheProvider.removeNowPlaying()
        }

        let movies: [Movie]
        do {
            movies = try await movieDataProvider.nowPlaying(page: page, country: country, language: language)
        } catch {
            throw .unknown
        }

        await movieCacheProvider.setNowPlaying(movies, page: page)

        return movies
    }

    func topRated(
        page: Int,
        country: String?,
        language: String?,
        ignoringCache: Bool
    ) async throws(MovieRepositoryError) -> [Movie] {
        if !ignoringCache, let cachedMovies = await movieCacheProvider.popular(page: page) {
            return cachedMovies
        }

        if ignoringCache {
            await movieCacheProvider.removeTopRated()
        }

        let movies: [Movie]
        do {
            movies = try await movieDataProvider.topRated(page: page, country: country, language: language)
        } catch {
            throw .unknown
        }

        await movieCacheProvider.setTopRated(movies, page: page)

        return movies
    }

    func upcoming(
        page: Int,
        country: String?,
        language: String?,
        ignoringCache: Bool
    ) async throws(MovieRepositoryError) -> [Movie] {
        if !ignoringCache, let cachedMovies = await movieCacheProvider.upcoming(page: page) {
            return cachedMovies
        }

        if ignoringCache {
            await movieCacheProvider.removeUpcoming()
        }

        let movies: [Movie]
        do {
            movies = try await movieDataProvider.upcoming(page: page, country: country, language: language)
        } catch {
            throw .unknown
        }

        await movieCacheProvider.setUpcoming(movies, page: page)

        return movies
    }

}
