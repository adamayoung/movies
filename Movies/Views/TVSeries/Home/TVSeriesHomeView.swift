//
//  TVSeriesHomeView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct TVSeriesHomeView: View {

    var body: some View {
        List(TVSeriesScreen.mainScreens) { screen in
            NavigationLink(value: screen) {
                Text(screen.name)
            }
        }
        .navigationTitle("TV_SERIES")
    }

}

#Preview {
    NavigationStack {
        TVSeriesHomeView()
    }
}
