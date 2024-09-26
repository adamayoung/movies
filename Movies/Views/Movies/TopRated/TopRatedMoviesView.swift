//
//  TopRatedMoviesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct TopRatedMoviesView: View {

    @State private var viewModel: TopRatedMoviesViewModel

    init(viewModel: TopRatedMoviesViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        MovieCollectionView(viewModel: viewModel)
            .movieCollectionStyle(.grid)
            .navigationTitle("TOP_RATED")
    }

}

#Preview("Top Rated Movies") {
    NavigationStack {
        TopRatedMoviesView(
            viewModel: TopRatedMoviesViewModel(
                dependencies: .mock()
            )
        )
    }
}

#Preview("No Content") {
    NavigationStack {
        TopRatedMoviesView(
            viewModel: TopRatedMoviesViewModel(
                dependencies: .mock(movies: [])
            )
        )
    }
}
