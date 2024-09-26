//
//  UpcomingMoviesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct UpcomingMoviesView: View {

    @State private var viewModel: UpcomingMoviesViewModel

    init(viewModel: UpcomingMoviesViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        MovieCollectionView(viewModel: viewModel)
            .movieCollectionStyle(.grid)
            .navigationTitle("UPCOMING")
    }

}

#Preview("Upcoming Movies") {
    NavigationStack {
        UpcomingMoviesView(
            viewModel: UpcomingMoviesViewModel(
                dependencies: .mock()
            )
        )
    }
}

#Preview("No Content") {
    NavigationStack {
        UpcomingMoviesView(
            viewModel: UpcomingMoviesViewModel(
                dependencies: .mock(movies: [])
            )
        )
    }
}
