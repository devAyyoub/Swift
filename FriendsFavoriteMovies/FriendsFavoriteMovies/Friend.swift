//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by Ayyoub on 25/1/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name : String
        
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Ayyoub"),
        Friend(name: "Mike"),
        Friend(name: "Jhon"),
        Friend(name: "Ayman"),
        Friend(name: "Rich"),
    ]
}
