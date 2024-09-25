//
//  AppTabView.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import SwiftUI

struct AppTabView: View {

    @Binding var selection: AppScreen?

    @State private var customization = TabViewCustomization()

    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                Tab(screen.name, systemImage: screen.systemImage, value: screen) {
                    screen.destination
                }
                .customizationID("moviesapp.tab.\(screen.id)")
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
    }
}

#Preview {
    AppTabView(selection: .constant(.home))
}
