//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Ayyoub on 23/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0
        
    var body: some View {
        VStack (alignment: .leading){
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(doesHighestScoreWin : $scoreboard.doesHighestScore , startingPoints : $startingPoints)
                .disabled(scoreboard.state != .setup)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                        .bold()
                    Text("Score")
                        .bold()
                        .opacity(scoreboard.state == .setup ? 0 : 1.0)
                }
                
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            TextField("Name", text: $player.name)
                                .autocorrectionDisabled(true)
                                .disabled(scoreboard.state != .setup)
                        }
                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                            .disabled(scoreboard.state == .gameOver || scoreboard.state == .setup)
                            
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0))
            }
            
            Spacer()
            
            HStack {
                Spacer()
                switch scoreboard.state {
                case .setup:
                    Button("Start game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        //scoreboard.resetScores(to: startingPoints)
                    }
                case .playing:
                    Button("End game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                        scoreboard.resetScores(to: startingPoints)
                    }
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
