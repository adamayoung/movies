//
//  FetchUpcomingMoviesUseCase.swift
//  MoviesDomain
//
//  Created by Adam Young on 26/09/2024.
//

import Foundation

public protocol FetchUpcomingMoviesUseCase {

    func execute(page: Int) async throws(FetchUpcomingMoviesError) -> [Movie]

    func execute(page: Int, ignoringCache: Bool) async throws(FetchUpcomingMoviesError) -> [Movie]

}

public enum FetchUpcomingMoviesError: Error {

    case unknown

}
