//
//  MovieScreen.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

enum MovieScreen: Codable, Hashable, Identifiable {

    case popular
    case nowPlaying
    case upcoming
    case topRated
    case details(id: Int)

    static var mainScreens: [MovieScreen] {
        [.popular, .nowPlaying, .upcoming, .topRated]
    }

    var id: String {
        let baseID = AppScreen.movies.id

        switch self {
        case .popular: return "\(baseID).popular"
        case .nowPlaying: return "\(baseID).nowPlaying"
        case .upcoming: return "\(baseID).upcoming"
        case .topRated: return "\(baseID).topRated"
        case let .details(id): return "\(baseID).details-\(id)"
        }
    }

    var name: LocalizedStringKey {
        switch self {
        case .popular: "POPULAR"
        case .nowPlaying: "NOW_PLAYING"
        case .upcoming: "UPCOMING"
        case .topRated: "TOP_RATED"
        case .details: "DETAILS"
        }
    }

    @ViewBuilder var destination: some View {
        switch self {
        case .popular:
            PopularMoviesView()

        case .nowPlaying:
            NowPlayingMoviesView()

        case .upcoming:
            UpcomingMoviesView()

        case .topRated:
            TopRatedMoviesView()

        case let .details(id):
            MovieView(id: id)
        }
    }

}
