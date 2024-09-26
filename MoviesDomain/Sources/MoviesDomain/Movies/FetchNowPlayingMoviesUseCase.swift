//
//  FetchNowPlayingMoviesUseCase.swift
//  MoviesDomain
//
//  Created by Adam Young on 26/09/2024.
//

import Foundation

public protocol FetchNowPlayingMoviesUseCase {

    func execute(page: Int) async throws(FetchNowPlayingMoviesError) -> [Movie]

    func execute(page: Int, ignoringCache: Bool) async throws(FetchNowPlayingMoviesError) -> [Movie]

}

public enum FetchNowPlayingMoviesError: Error {

    case unknown

}
