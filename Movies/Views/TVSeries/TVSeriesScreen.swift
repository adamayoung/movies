//
//  TVSeriesScreen.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

enum TVSeriesScreen: Codable, Hashable, Identifiable {

    case popular
    case airingToday
    case currentlyAiring
    case topRated
    case details(id: Int)

    static var mainScreens: [TVSeriesScreen] {
        [.popular, .airingToday, .currentlyAiring, .topRated]
    }

    var id: String {
        let baseID = AppScreen.tvSeries.id

        switch self {
        case .popular: return "\(baseID).popular"
        case .airingToday: return "\(baseID).nowPlaying"
        case .currentlyAiring: return "\(baseID).upcoming"
        case .topRated: return "\(baseID).topRated"
        case let .details(id): return "\(baseID).details-\(id)"
        }
    }

    var name: LocalizedStringKey {
        switch self {
        case .popular: "POPULAR"
        case .airingToday: "AIRING_TODAY"
        case .currentlyAiring: "CURRENTLY_AIRING"
        case .topRated: "TOP_RATED"
        case .details: "DETAILS"
        }
    }

    @ViewBuilder @MainActor var destination: some View {
        switch self {
        case .popular:
            PopularTVSeriesView()

        case .airingToday:
            AiringTodayTVSeriesView()

        case .currentlyAiring:
            CurrentlyAiringTVSeriesView()

        case .topRated:
            TopRatedTVSeriesView()

        case let .details(id):
            TVSeriesView(id: id)
        }
    }

}
