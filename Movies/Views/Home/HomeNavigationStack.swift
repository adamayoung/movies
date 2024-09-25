//
//  HomeNavigationStack.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct HomeNavigationStack: View {

    var body: some View {
        NavigationStack {
            HomeView()
                .navigationDestinations()
        }
    }

}

#Preview {
    HomeNavigationStack()
}
