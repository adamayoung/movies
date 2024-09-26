//
//  MovieListRow.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import MoviesDomain
import RemoteImage
import SwiftUI

struct MovieListRow: View {

    var movie: Movie

    var body: some View {
        HStack {
            PosterImage(url: movie.posterURL)
                .frame(width: 150, height: 150 * 1.5)

            VStack(alignment: .leading) {
                Text(verbatim: movie.title)
                    .font(.headline)
            }
            .padding(.leading)
        }
    }

}

#Preview {
    List {
        MovieListRow(movie: Movie.alienRomulus)
    }
}
