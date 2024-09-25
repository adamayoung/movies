//
//  MoviesHomeView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct MoviesHomeView: View {

    var body: some View {
        List(MovieScreen.mainScreens) { screen in
            NavigationLink(value: screen) {
                Text(screen.name)
            }
        }
        .navigationTitle("MOVIES")
    }

}

#Preview {
    NavigationStack {
        MoviesHomeView()
    }
}
