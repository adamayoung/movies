//
//  MovieCacheProvider.swift
//  MoviesData
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesDomain

protocol MovieCacheProvider {

    func movie(withID id: Movie.ID) async -> Movie?

    func setMovie(_ movie: Movie, withID id: Movie.ID) async

    func removeMovie(withID id: Movie.ID) async

    func popular(page: Int) async -> [Movie]?

    func setPopular(_ movies: [Movie], page: Int) async

    func removePopular() async

    func nowPlaying(page: Int) async -> [Movie]?

    func setNowPlaying(_ movies: [Movie], page: Int) async

    func removeNowPlaying() async

    func topRated(page: Int) async -> [Movie]?

    func setTopRated(_ movies: [Movie], page: Int) async

    func removeTopRated() async

    func upcoming(page: Int) async -> [Movie]?

    func setUpcoming(_ movies: [Movie], page: Int) async

    func removeUpcoming() async

}
