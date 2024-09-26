//
//  MovieDataProvider.swift
//  MoviesData
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesDomain

protocol MovieDataProvider {

    func movie(withID id: Movie.ID, language: String?) async throws -> Movie

    func movies(withIDs ids: [Movie.ID], language: String?) async throws -> [Movie]

    func popular(page: Int, country: String?, language: String?) async throws -> [Movie]

    func nowPlaying(page: Int, country: String?, language: String?) async throws -> [Movie]

    func topRated(page: Int, country: String?, language: String?) async throws -> [Movie]

    func upcoming(page: Int, country: String?, language: String?) async throws -> [Movie]

}
