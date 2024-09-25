//
//  HomeView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        List {
            Section("MOVIES") {
                ForEach(MovieScreen.mainScreens) { screen in
                    NavigationLink(value: screen) {
                        Text(screen.name)
                    }
                }
            }

            Section("TV_SERIES") {
                ForEach(TVSeriesScreen.mainScreens) { screen in
                    NavigationLink(value: screen) {
                        Text(screen.name)
                    }
                }
            }

            Section("PEOPLE") {
                ForEach(PeopleScreen.mainScreens) { screen in
                    NavigationLink(value: screen) {
                        Text(screen.name)
                    }
                }
            }
        }
        .navigationTitle("HOME")
    }

}

#Preview {
    NavigationStack {
        HomeView()
    }
}
