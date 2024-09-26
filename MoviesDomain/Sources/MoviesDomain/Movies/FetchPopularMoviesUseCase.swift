//
//  FetchPopularMoviesUseCase.swift
//  MoviesDomain
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation

public protocol FetchPopularMoviesUseCase {

    func execute(page: Int) async throws(FetchPopularMoviesError) -> [Movie]

    func execute(page: Int, ignoringCache: Bool) async throws(FetchPopularMoviesError) -> [Movie]

}

public enum FetchPopularMoviesError: Error {

    case unknown

}
