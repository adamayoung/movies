//
//  MoviesHomeView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import MoviesDomain
import SwiftUI

struct MoviesHomeView: View {

    @State private var viewModel: MoviesHomeViewModel

    init(viewModel: MoviesHomeViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        List {
            Section {
                NavigationLink(value: MovieScreen.popular) {
                    Text(MovieScreen.popular.name)
                        .font(.headline).bold()
                }

                MovieCarousel(movies: viewModel.popularMovies)
                    .listRowInsets(EdgeInsets())
            }
            .listRowSeparator(.hidden)

            Section {
                NavigationLink(value: MovieScreen.nowPlaying) {
                    Text(MovieScreen.nowPlaying.name)
                        .font(.headline).bold()
                }

                MovieCarousel(movies: viewModel.nowPlayingMovies)
                    .listRowInsets(EdgeInsets())
            }
            .listRowSeparator(.hidden)

            Section {
                NavigationLink(value: MovieScreen.upcoming) {
                    Text(MovieScreen.upcoming.name)
                        .font(.headline).bold()
                }

                MovieCarousel(movies: viewModel.upcomingMovies)
                    .listRowInsets(EdgeInsets())
            }
            .listRowSeparator(.hidden)

            Section {
                NavigationLink(value: MovieScreen.topRated) {
                    Text(MovieScreen.topRated.name)
                        .font(.headline).bold()
                }

                MovieCarousel(movies: viewModel.topRatedMovies)
                    .listRowInsets(EdgeInsets())
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .task {
            await viewModel.fetchData()
        }
        .navigationTitle("MOVIES")
    }

}

#Preview {
    NavigationStack {
        MoviesHomeView(viewModel: MoviesHomeViewModel(dependencies: .mock))
    }
}
