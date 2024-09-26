//
//  MovieCollectionStyle.swift
//  Movies
//
//  Created by Adam Young on 26/09/2024.
//

import SwiftUI

protocol MovieCollectionStyle {}

struct GridMovieCollectionStyle: MovieCollectionStyle {}

struct ListMovieCollectionStyle: MovieCollectionStyle {}

extension MovieCollectionStyle where Self == GridMovieCollectionStyle {

    static var grid: GridMovieCollectionStyle { GridMovieCollectionStyle() }
}

extension MovieCollectionStyle where Self == ListMovieCollectionStyle {

    static var list: ListMovieCollectionStyle { ListMovieCollectionStyle() }
}

extension EnvironmentValues {

    @Entry var movieCollectionStyle: MovieCollectionStyle = ListMovieCollectionStyle()

}

extension View {

    func movieCollectionStyle(_ style: some MovieCollectionStyle) -> some View {
        environment(\.movieCollectionStyle, style)
    }

}
