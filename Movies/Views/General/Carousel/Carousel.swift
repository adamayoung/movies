//
//  Carousel.swift
//  Movies
//
//  Created by Adam Young on 26/09/2024.
//

import SwiftUI

struct Carousel<Content: View>: View {

    @ViewBuilder var content: Content

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                ForEach(subviews: content) { subview in
                    subview
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .contentMargins(16)
    }

}
