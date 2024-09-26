//
//  MovieCollectionView.swift
//  Movies
//
//  Created by Adam Young on 26/09/2024.
//

import MoviesDomain
import SwiftUI

struct MovieCollectionView: View {

    @Environment(\.movieCollectionStyle)
    private var movieCollectionStyle

    var viewModel: MovieCollectionViewModel

    var body: some View {
        content
            .scrollDisabled(viewModel.showLoadingIndicator)
            .overlay {
                if viewModel.showLoadingIndicator {
                    ProgressView()
                        .progressViewStyle(.circular)
                }

                if !viewModel.isContentAvailable {
                    ContentUnavailableView(
                        "NO_MOVIES",
                        systemImage: "film",
                        description: Text("THERE_ARENT_ANY_MOVIES_AT_THE_MOMENT")
                    )
                }
            }
            .refreshable {
                await viewModel.fetchData()
            }
            .task {
                if viewModel.movies == nil {
                    await viewModel.fetchData()
                }
            }
    }

    @ViewBuilder private var content: some View {
        switch movieCollectionStyle {
        case is ListMovieCollectionStyle:
            MovieList(viewModel: viewModel, movieDidAppear: movieDidAppear)

        case is GridMovieCollectionStyle:
            MovieGrid(viewModel: viewModel, movieDidAppear: movieDidAppear)

        default:
            EmptyView()
        }
    }

    private func movieDidAppear(_ movie: Movie) {
        guard let movies = viewModel.movies else {
            return
        }

        guard let index = movies.firstIndex(where: { $0.id == movie.id }) else {
            return
        }

        let thresholdIndex = movies.index(movies.endIndex, offsetBy: -5)
        guard index > thresholdIndex else {
            return
        }

        Task {
            await viewModel.fetchNextPage()
        }
    }

}

#Preview {
    MovieCollectionView(
        viewModel: MovieCollectionViewModel(
            dependencies: .mock()
        )
    )
}
