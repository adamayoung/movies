//
//  TopRatedMoviesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct TopRatedMoviesView: View {

    var body: some View {
        Text("TOP_RATED_MOVIES")
            .navigationTitle("TOP_RATED")
    }

}

#Preview {
    NavigationStack {
        TopRatedMoviesView()
    }
}
