//
//  NavigationDestinationsViewModifier.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct NavigationDestinationsViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .navigationDestination(for: MovieScreen.self) { screen in
                screen.destination
            }
            .navigationDestination(for: TVSeriesScreen.self) { screen in
                screen.destination
            }
            .navigationDestination(for: PeopleScreen.self) { screen in
                screen.destination
            }
    }
}

extension View {

    func navigationDestinations() -> some View {
        modifier(NavigationDestinationsViewModifier())
    }

}
