//
//  PopularMoviesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct PopularMoviesView: View {

    var body: some View {
        Text("POPULAR_MOVIES")
            .navigationTitle("POPULAR")
    }

}

#Preview {
    NavigationStack {
        PopularMoviesView()
    }
}
