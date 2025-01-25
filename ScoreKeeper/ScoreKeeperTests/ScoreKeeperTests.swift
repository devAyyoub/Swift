//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Ayyoub on 24/1/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 5),
        ])
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest score wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 5),
            ],
            state : .gameOver,
            doesHighestScore : true
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre" , score: 5)])
    }
    
    @Test("Lowest score win")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 5),
            ],
            state : .gameOver,
            doesHighestScore : false
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha" , score: 0)])
    }
}
