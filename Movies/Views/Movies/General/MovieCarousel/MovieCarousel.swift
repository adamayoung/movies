//
//  MovieCarousel.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import MoviesDomain
import SwiftUI

struct MovieCarousel: View {

    var movies: [Movie]

    var body: some View {
        Carousel {
            let height = 150.0
            let width = height * (3840 / 2160)

            ForEach(movies) { movie in
                NavigationLink(value: MovieScreen.details(movie: movie)) {
                    VStack(alignment: .leading) {
                        BackdropImage(url: movie.backdropURL)
                            .frame(width: width, height: height)

                        Group {
                            Text(verbatim: movie.title)
                                .font(.footnote)
                        }
                        .padding(.horizontal)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .frame(height: 170)
    }
}

#Preview {
    NavigationStack {
        List {
            MovieCarousel(movies: Movie.mocks)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
