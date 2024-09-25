//
//  PeopleNavigationStack.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct PeopleNavigationStack: View {

    var body: some View {
        NavigationStack {
            PopularPeopleView()
                .navigationDestinations()
        }
    }

}

#Preview {
    PeopleNavigationStack()
}
