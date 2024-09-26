//
//  MovieView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import MoviesDomain
import SwiftUI

struct MovieView: View {

    @State private var viewModel: MovieViewModel

    init(viewModel: MovieViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        List {
            if let movie = viewModel.movie {
                content(movie: movie)
            }
        }
        .overlay {
            if viewModel.movie == nil {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .task {
            await viewModel.fetchData()
        }
    }

    @ViewBuilder
    private func content(movie: Movie) -> some View {
        Text(verbatim: movie.title)
            .font(.headline)

        Text(verbatim: movie.overview)
            .multilineTextAlignment(.leading)
    }

}

#Preview {
    NavigationStack {
        MovieView(viewModel: MovieViewModel(movieID: Movie.alienRomulus.id, dependencies: .mock))
    }
}
