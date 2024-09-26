//
//  FetchTopRatedMoviesUseCase.swift
//  MoviesDomain
//
//  Created by Adam Young on 26/09/2024.
//

import Foundation

public protocol FetchTopRatedMoviesUseCase {

    func execute(page: Int) async throws(FetchTopRatedMoviesError) -> [Movie]

    func execute(page: Int, ignoringCache: Bool) async throws(FetchTopRatedMoviesError) -> [Movie]

}

public enum FetchTopRatedMoviesError: Error {

    case unknown

}
