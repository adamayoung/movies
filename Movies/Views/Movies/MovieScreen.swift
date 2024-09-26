//
//  MovieScreen.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import MoviesDomain
import SwiftUI

enum MovieScreen: Hashable, Identifiable {

    case popular
    case nowPlaying
    case upcoming
    case topRated
    case detailsWithID(id: Int)
    case details(movie: Movie)

    static var mainScreens: [MovieScreen] {
        [.popular, .nowPlaying, .upcoming, .topRated]
    }

    var id: String {
        let baseID = AppScreen.movies.id

        switch self {
        case .popular: return "\(baseID).popular"
        case .nowPlaying: return "\(baseID).nowPlaying"
        case .upcoming: return "\(baseID).upcoming"
        case .topRated: return "\(baseID).topRated"
        case let .detailsWithID(id): return "\(baseID).details-\(id)"
        case let .details(movie): return "\(baseID).details-\(movie.id)"
        }
    }

    var name: LocalizedStringKey {
        switch self {
        case .popular: "POPULAR"
        case .nowPlaying: "NOW_PLAYING"
        case .upcoming: "UPCOMING"
        case .topRated: "TOP_RATED"
        case .details, .detailsWithID: "DETAILS"
        }
    }

    @ViewBuilder @MainActor var destination: some View {
        switch self {
        case .popular:
            PopularMoviesView(
                viewModel: PopularMoviesViewModel(
                    dependencies: DIContainer.shared.popularMovies()
                )
            )

        case .nowPlaying:
            NowPlayingMoviesView(
                viewModel: NowPlayingMoviesViewModel(
                    dependencies: DIContainer.shared.nowPlayingMovies()
                )
            )

        case .upcoming:
            UpcomingMoviesView(
                viewModel: UpcomingMoviesViewModel(
                    dependencies: DIContainer.shared.upcomingMovies()
                )
            )

        case .topRated:
            TopRatedMoviesView(
                viewModel: TopRatedMoviesViewModel(
                    dependencies: DIContainer.shared.topRatedMovies()
                )
            )

        case let .details(movie):
            MovieView(
                viewModel: MovieViewModel(
                    movie: movie,
                    dependencies: DIContainer.shared.movie()
                )
            )

        case let .detailsWithID(id):
            MovieView(
                viewModel: MovieViewModel(
                    movieID: id,
                    dependencies: DIContainer.shared.movie()
                )
            )
        }
    }

}
