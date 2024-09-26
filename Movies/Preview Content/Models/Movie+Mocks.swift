//
//  Movie+Mocks.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import MoviesDomain

extension Movie {

    static var alienRomulus: Movie {
        Movie(
            id: 945_961,
            title: "Alien: Romulus",
            overview: "While scavenging the deep ends of a derelict space station, a group of young space colonizers"
                + " come face to face with the most terrifying life form in the universe.",
            logoURL: URL(string: "https://image.tmdb.org/t/p/w500/69wA8nqCAemlTQkDTwOmKvdtUPW.png"),
            posterURL: URL(string: "https://image.tmdb.org/t/p/w780/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg"),
            backdropURL: URL(string: "https://image.tmdb.org/t/p/w500/9SSEUrSqhljBMzRe4aBTh17rUaC.jpg")
        )
    }

    static var insideOut2: Movie {
        Movie(
            id: 1_022_789,
            title: "Inside Out 2",
            overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something"
                + " entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running"
                + " a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it"
                + " looks like she’s not alone.",
            logoURL: URL(string: "https://image.tmdb.org/t/p/w500/h40hblm8J1if7T2CBMjCD85HwuD.png"),
            posterURL: URL(string: "https://image.tmdb.org/t/p/w780/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg"),
            backdropURL: URL(string: "https://image.tmdb.org/t/p/w500/dKvvW3euRwUY0Nyl6JBP5tXLPJW.jpg")
        )
    }

    static var aQuietPlaceDayOne: Movie {
        Movie(
            id: 762_441,
            title: "A Quiet Place: Day One",
            overview: "As New York City is invaded by alien creatures who hunt by sound, a woman named Sam fights to"
                + " survive with her cat.",
            logoURL: URL(string: "https://image.tmdb.org/t/p/w500/hdlpXXbRWPlp5J5ni1qM7D7vezp.png"),
            posterURL: URL(string: "https://image.tmdb.org/t/p/w780/hU42CRk14JuPEdqZG3AWmagiPAP.jpg"),
            backdropURL: URL(string: "https://image.tmdb.org/t/p/w500/2RVcJbWFmICRDsVxRI8F5xRmRsK.jpg")
        )
    }

    static var mocks: [Movie] {
        [.alienRomulus, .insideOut2, .aQuietPlaceDayOne]
    }

}
