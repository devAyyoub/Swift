//
//  FeatureCard.swift
//  OnBoardingFlow
//
//  Created by Ayyoub on 21/1/25.
//

import SwiftUI

struct FeatureCard: View {
    let iconName : String
    let despcription : String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            
            Text(despcription)
            
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint)
                .opacity(0.25)
                .brightness(-0.4)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill",
                despcription: "A multiline description about a feature paired with the image on the left.")
}
