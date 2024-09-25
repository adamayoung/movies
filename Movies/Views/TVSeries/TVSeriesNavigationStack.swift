//
//  TVSeriesNavigationStack.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct TVSeriesNavigationStack: View {

    var body: some View {
        NavigationStack {
            TVSeriesHomeView()
                .navigationDestinations()
        }
    }

}

#Preview {
    TVSeriesNavigationStack()
}
