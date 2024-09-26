//
//  MovieCachingStoreProvider.swift
//  MoviesData
//
//  Created by Adam Young on 25/09/2024.
//

import CachingStore
import Foundation
import MoviesDomain

final class MovieCachingStoreProvider: MovieCacheProvider {

    private let cache: KeyValueCache

    init(cache: KeyValueCache) {
        self.cache = cache
    }

    func movie(withID id: Movie.ID) async -> Movie? {
        await cache.get(forKey: CacheKey.movie(id: id))
    }

    func setMovie(_ movie: Movie, withID id: Movie.ID) async {
        await cache.set(movie, forKey: CacheKey.movie(id: id))
    }

    func removeMovie(withID id: Movie.ID) async {
        await cache.remove(withKey: CacheKey.movie(id: id))
    }

    func popular(page: Int) async -> [Movie]? {
        await movieList(forKey: CacheKey.popular, page: page)
    }

    func setPopular(_ movies: [Movie], page: Int) async {
        await setMovieList(movies, forKey: CacheKey.popular, page: page)
    }

    func removePopular() async {
        await cache.remove(withKey: CacheKey.popular)
    }

    func nowPlaying(page: Int) async -> [Movie]? {
        await movieList(forKey: CacheKey.nowPlaying, page: page)
    }

    func setNowPlaying(_ movies: [Movie], page: Int) async {
        await setMovieList(movies, forKey: CacheKey.nowPlaying, page: page)
    }

    func removeNowPlaying() async {
        await cache.remove(withKey: CacheKey.nowPlaying)
    }

    func topRated(page: Int) async -> [Movie]? {
        await movieList(forKey: CacheKey.topRated, page: page)
    }

    func setTopRated(_ movies: [Movie], page: Int) async {
        await setMovieList(movies, forKey: CacheKey.topRated, page: page)
    }

    func removeTopRated() async {
        await cache.remove(withKey: CacheKey.topRated)
    }

    func upcoming(page: Int) async -> [Movie]? {
        await movieList(forKey: CacheKey.upcoming, page: page)
    }

    func setUpcoming(_ movies: [Movie], page: Int) async {
        await setMovieList(movies, forKey: CacheKey.upcoming, page: page)
    }

    func removeUpcoming() async {
        await cache.remove(withKey: CacheKey.upcoming)
    }

}

extension MovieCachingStoreProvider {

    private func movieList(forKey key: String, page: Int) async -> [Movie]? {
        guard
            let cachedMovies: [Int: [Movie.ID]] = await cache.get(forKey: key),
            let movieIDs = cachedMovies[page]
        else {
            return nil
        }

        var movies = [Movie]()
        for movieID in movieIDs {
            guard let movie = await movie(withID: movieID) else {
                return nil
            }

            movies.append(movie)
        }

        return movies
    }

    private func setMovieList(_ movies: [Movie], forKey key: String, page: Int) async {
        var cachedMovies: [Int: [Movie.ID]] = await cache.get(forKey: key) ?? [:]
        let movieIDs = movies.map(\.id)
        cachedMovies[page] = movieIDs

        await cache.set(cachedMovies, forKey: key)

        for movie in movies {
            await setMovie(movie, withID: movie.id)
        }
    }

}

extension MovieCachingStoreProvider {

    private enum CacheKey {

        static func movie(id: Movie.ID) -> String {
            "movie-\(id)"
        }

        static let popular = "movies-popular"
        static let nowPlaying = "movies-now-playing"
        static let topRated = "movies-topRated"
        static let upcoming = "movies-upcoming"

    }

}
