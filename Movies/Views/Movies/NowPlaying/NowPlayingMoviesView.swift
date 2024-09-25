//
//  NowPlayingMoviesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct NowPlayingMoviesView: View {

    var body: some View {
        Text("NOW_PLAYING_MOVIES")
            .navigationTitle("NOW_PLAYING")
    }

}

#Preview {
    NavigationStack {
        NowPlayingMoviesView()
    }
}
