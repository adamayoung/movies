//
//  PersonView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct PersonView: View {
    var id: Int

    var body: some View {
        Text(verbatim: "Person \(id) Details")
            .navigationTitle("Person \(id)")
    }

}

#Preview {
    NavigationStack {
        PersonView(id: 1)
    }
}
