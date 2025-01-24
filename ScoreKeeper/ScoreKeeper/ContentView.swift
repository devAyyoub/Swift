//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Ayyoub on 23/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players : [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0)
    ]
    
    @State private var scores : [Int] = [0, 0 ,0]
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                        .bold()
                    Text("Score")
                        .bold()
                }
                
                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                            .autocorrectionDisabled(true)
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
            
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
