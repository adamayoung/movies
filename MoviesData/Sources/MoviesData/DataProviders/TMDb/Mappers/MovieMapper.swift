//
//  MovieMapper.swift
//  MoviesData
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesDomain
import TMDb

struct MovieMapper {

    private init() {}

    static func map(
        from dataModel: TMDb.Movie,
        logoPath: URL? = nil,
        imagesConfiguration: ImagesConfiguration
    ) -> MoviesDomain.Movie {
        Movie(
            id: dataModel.id,
            title: dataModel.title,
            overview: dataModel.overview ?? "",
            logoURL: imagesConfiguration.logoURL(for: logoPath),
            posterURL: imagesConfiguration.posterURL(for: dataModel.posterPath, idealWidth: 600),
            backdropURL: imagesConfiguration.backdropURL(for: dataModel.backdropPath, idealWidth: 600)
        )
    }

}
