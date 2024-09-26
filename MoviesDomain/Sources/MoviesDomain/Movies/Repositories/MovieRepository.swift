//
//  MovieRepository.swift
//  MoviesDomain
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation

public protocol MovieRepository {

    func movie(withID id: Movie.ID, language: String?) async throws(MovieRepositoryError) -> Movie

    func popular(
        page: Int,
        country: String?,
        language: String?,
        ignoringCache: Bool
    ) async throws(MovieRepositoryError) -> [Movie]

    func nowPlaying(
        page: Int,
        country: String?,
        language: String?,
        ignoringCache: Bool
    ) async throws(MovieRepositoryError) -> [Movie]

    func topRated(
        page: Int,
        country: String?,
        language: String?,
        ignoringCache: Bool
    ) async throws(MovieRepositoryError) -> [Movie]

    func upcoming(
        page: Int,
        country: String?,
        language: String?,
        ignoringCache: Bool
    ) async throws(MovieRepositoryError) -> [Movie]

}

public enum MovieRepositoryError: Error {

    case notFound
    case unknown

}
