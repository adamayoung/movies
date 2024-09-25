//
//  CurrentlyAiringTVSeriesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct CurrentlyAiringTVSeriesView: View {

    var body: some View {
        Text("CURRENTLY_AIRING_TV_SERIES")
            .navigationTitle("CURRENTLY_AIRING")
    }

}

#Preview {
    NavigationStack {
        CurrentlyAiringTVSeriesView()
    }
}
