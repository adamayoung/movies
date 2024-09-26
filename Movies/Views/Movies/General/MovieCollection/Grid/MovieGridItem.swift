//
//  MovieGridItem.swift
//  Movies
//
//  Created by Adam Young on 26/09/2024.
//

import MoviesDomain
import SwiftUI

struct MovieGridItem: View {

    var movie: Movie

    var body: some View {
        VStack {
            PosterImage(url: movie.posterURL)
                .frame(width: 100, height: 100 * 1.5)

            Text(verbatim: movie.title)
                .font(.headline)
                .multilineTextAlignment(.center)

            Spacer()
        }
    }
}

#Preview {
    MovieGridItem(movie: Movie.alienRomulus)
}
