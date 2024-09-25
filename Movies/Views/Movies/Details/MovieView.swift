//
//  MovieView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct MovieView: View {

    var id: Int

    var body: some View {
        Text(verbatim: "Movie \(id) Details")
            .navigationTitle("Movie Series \(id)")
    }

}

#Preview {
    NavigationStack {
        MovieView(id: 1)
    }
}
