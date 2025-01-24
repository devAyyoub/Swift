//
//  Player.swift
//  ScoreKeeper
//
//  Created by Ayyoub on 23/1/25.
//

import Foundation

struct Player  : Identifiable {
    let id = UUID()
    
    var name : String
    var score : Int
}
