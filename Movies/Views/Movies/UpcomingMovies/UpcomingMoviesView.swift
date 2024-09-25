//
//  UpcomingMoviesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct UpcomingMoviesView: View {

    var body: some View {
        Text("UPCOMING_MOVIES")
            .navigationTitle("UPCOMING")
    }

}

#Preview {
    NavigationStack {
        NowPlayingMoviesView()
    }
}
