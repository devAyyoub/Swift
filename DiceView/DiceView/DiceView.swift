//
//  DiceView.swift
//  DiceView
//
//  Created by Ayyoub on 22/1/25.
//

import SwiftUI

struct DiceView: View {
    @State private var numberOfPipes: Int = Int.random(in: 1...6)
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPipes).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
            
            Button("Roll") {
                withAnimation{
                    numberOfPipes = Int.random(in: 1...6)
                }
                
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
}
