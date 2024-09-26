//
//  MovieList.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import MoviesDomain
import SwiftUI

struct MovieList: View {

    var viewModel: MovieCollectionViewModel
    var movieDidAppear: (Movie) -> Void

    var body: some View {
        List(viewModel.movies ?? []) { movie in
            NavigationLink(value: MovieScreen.details(movie: movie)) {
                MovieListRow(movie: movie)
                    .onAppear { movieDidAppear(movie) }
            }

            if viewModel.isFetching, !viewModel.showLoadingIndicator {
                HStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(.circular)
                    Spacer()
                }
            }
        }
    }

}

#Preview {
    NavigationStack {
        MovieList(
            viewModel: MovieCollectionViewModel(
                dependencies: .mock()
            ),
            movieDidAppear: { _ in }
        )
    }
}
