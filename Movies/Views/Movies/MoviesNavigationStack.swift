//
//  MoviesNavigationStack.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct MoviesNavigationStack: View {

    var body: some View {
        NavigationStack {
            MoviesHomeView(viewModel: MoviesHomeViewModel(dependencies: DIContainer.shared.moviesHome()))
                .navigationDestinations()
        }
    }

}

#Preview {
    MoviesNavigationStack()
}
