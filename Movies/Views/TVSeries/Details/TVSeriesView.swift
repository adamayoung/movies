//
//  TVSeriesView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct TVSeriesView: View {

    var id: Int

    var body: some View {
        Text(verbatim: "TV Series \(id) Details")
            .navigationTitle("TV Series \(id)")
    }

}

#Preview {
    NavigationStack {
        TVSeriesView(id: 1)
    }
}
