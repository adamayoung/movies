//
//  AppScreen.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

enum AppScreen: Codable, Hashable, Identifiable, CaseIterable {

    case home
    case movies
    case tvSeries
    case people

    var id: String {
        switch self {
        case .home: "home"
        case .movies: "movies"
        case .tvSeries: "tvSeries"
        case .people: "people"
        }
    }

    var name: LocalizedStringKey {
        switch self {
        case .home: "HOME"
        case .movies: "MOVIES"
        case .tvSeries: "TV_SERIES"
        case .people: "PEOPLE"
        }
    }

    var systemImage: String {
        switch self {
        case .home: "house"
        case .movies: "film"
        case .tvSeries: "tv"
        case .people: "person.2"
        }
    }

    @ViewBuilder var destination: some View {
        switch self {
        case .home:
            HomeNavigationStack()

        case .movies:
            MoviesNavigationStack()

        case .tvSeries:
            TVSeriesNavigationStack()

        case .people:
            PeopleNavigationStack()
        }
    }

}
