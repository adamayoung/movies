//
//  MovieGrid.swift
//  Movies
//
//  Created by Adam Young on 26/09/2024.
//

import MoviesDomain
import SwiftUI

struct MovieGrid: View {

    var viewModel: MovieCollectionViewModel
    var movieDidAppear: (Movie) -> Void

    #if os(iOS)
        @Environment(\.horizontalSizeClass)
        private var horizontalSizeClass
    #endif

    private let columnsCompact: [GridItem] = [
        GridItem(.adaptive(minimum: 100), spacing: 16)
    ]

    private let columnsRegular: [GridItem] = [
        GridItem(.adaptive(minimum: 150), spacing: 16)
    ]

    private var columns: [GridItem] {
        #if os(iOS)
            if horizontalSizeClass == .compact {
                return columnsCompact
            } else {
                return columnsRegular
            }
        #else
            return columnsRegular
        #endif
    }

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 16
            ) {
                ForEach(viewModel.movies ?? []) { movie in
                    NavigationLink(value: MovieScreen.details(movie: movie)) {
                        MovieGridItem(movie: movie)
                            .onAppear { movieDidAppear(movie) }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)

            if viewModel.isFetching, !viewModel.showLoadingIndicator {
                HStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(.circular)
                    Spacer()
                }
                .padding()
            }
        }
    }

}

#Preview {
    MovieGrid(
        viewModel: MovieCollectionViewModel(
            dependencies: .mock()
        ),
        movieDidAppear: { _ in }
    )
}
