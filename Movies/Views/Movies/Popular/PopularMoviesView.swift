//
//  PopularMoviesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import MoviesDomain
import SwiftUI

struct PopularMoviesView: View {

    @State private var viewModel: PopularMoviesViewModel

    init(viewModel: PopularMoviesViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        MovieCollectionView(viewModel: viewModel)
            .movieCollectionStyle(.grid)
            .navigationTitle("POPULAR")
    }

}

#Preview("Popular Movies") {
    NavigationStack {
        PopularMoviesView(
            viewModel: PopularMoviesViewModel(
                dependencies: .mock()
            )
        )
    }
}

#Preview("No Content") {
    NavigationStack {
        PopularMoviesView(
            viewModel: PopularMoviesViewModel(
                dependencies: .mock(movies: [])
            )
        )
    }
}
