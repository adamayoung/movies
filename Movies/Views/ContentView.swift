//
//  ContentView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {

    @State private var selection: AppScreen? = .home

    var body: some View {
        AppTabView(selection: $selection)
    }

}

#Preview {
    ContentView()
}
