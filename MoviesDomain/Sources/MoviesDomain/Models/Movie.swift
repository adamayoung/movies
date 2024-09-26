//
//  Movie.swift
//  MoviesDomain
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation

public struct Movie: Identifiable, Sendable, Hashable {

    public let id: Int
    public let title: String
    public let overview: String
    public let logoURL: URL?
    public let posterURL: URL?
    public let backdropURL: URL?

    public init(
        id: Int,
        title: String,
        overview: String,
        logoURL: URL? = nil,
        posterURL: URL? = nil,
        backdropURL: URL? = nil
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.logoURL = logoURL
        self.posterURL = posterURL
        self.backdropURL = backdropURL
    }

}
