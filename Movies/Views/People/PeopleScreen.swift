//
//  PeopleScreen.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

enum PeopleScreen: Codable, Hashable, Identifiable {

    case popular
    case details(id: Int)

    static var mainScreens: [PeopleScreen] {
        [.popular]
    }

    var id: String {
        let baseID = AppScreen.people.id

        switch self {
        case .popular: return "\(baseID).popular"
        case let .details(id): return "\(baseID).details-\(id)"
        }
    }

    var name: LocalizedStringKey {
        switch self {
        case .popular: "POPULAR"
        case .details: "DETAILS"
        }
    }

    @ViewBuilder var destination: some View {
        switch self {
        case .popular:
            PopularMoviesView()

        case let .details(id):
            PersonView(id: id)
        }
    }

}
