//
//  BackdropImage.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import MoviesDomain
import SwiftUI

struct BackdropImage: View {

    var url: URL?

    @State private var image: UIImage?
    @Environment(\.imageDownloader)
    private var imageDownloader

    var body: some View {
        GeometryReader { proxy in
            Image(uiImage: image ?? UIImage())
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .cornerRadius(10)
                .clipped()
                .id(image)
                .transition(.opacity.animation(.easeOut))
                .task {
                    if let url {
                        image = await imageDownloader.download(url: url)
                    }
                }
        }
    }

}

#Preview {
    BackdropImage(url: Movie.alienRomulus.backdropURL)
}
