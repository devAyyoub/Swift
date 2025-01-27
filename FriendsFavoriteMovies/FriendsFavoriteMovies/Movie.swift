//
//  Movie.swift
//  FriendsFavoriteMovies
//
//  Created by Ayyoub on 25/1/25.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title : String
    var releaseDate : Date
    var favoritedBy = [Friend]()
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData = [
        Movie(title: "Interestellar",
              releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "Jhon Wick",
              releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie(title: "Harry Potter",
              releaseDate: Date(timeIntervalSinceReferenceDate: 15_000_000)),
        Movie(title: "Origin",
              releaseDate: Date(timeIntervalSinceReferenceDate: -12_000_000_000)),
        Movie(title: "Tenet",
              releaseDate: Date(timeIntervalSinceReferenceDate: 20_000_000)),
        Movie(title: "Creed",
              releaseDate: Date(timeIntervalSinceReferenceDate: 4_000_000_000)),
    ]
}
