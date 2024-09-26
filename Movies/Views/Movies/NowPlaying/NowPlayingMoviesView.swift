//
//  NowPlayingMoviesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct NowPlayingMoviesView: View {

    @State private var viewModel: NowPlayingMoviesViewModel

    init(viewModel: NowPlayingMoviesViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        MovieCollectionView(viewModel: viewModel)
            .movieCollectionStyle(.grid)
            .navigationTitle("NOW_PLAYING")
    }

}

#Preview("Now Playing Movies") {
    NavigationStack {
        NowPlayingMoviesView(
            viewModel: NowPlayingMoviesViewModel(
                dependencies: .mock()
            )
        )
    }
}

#Preview("No Content") {
    NavigationStack {
        NowPlayingMoviesView(
            viewModel: NowPlayingMoviesViewModel(
                dependencies: .mock(movies: [])
            )
        )
    }
}
