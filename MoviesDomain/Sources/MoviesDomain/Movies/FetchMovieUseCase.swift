//
//  FetchMovieUseCase.swift
//  MoviesDomain
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation

public protocol FetchMovieUseCase {

    func execute(id: Movie.ID) async throws(FetchMovieError) -> Movie

}

public enum FetchMovieError: Error {

    case notFound
    case unknown

}
