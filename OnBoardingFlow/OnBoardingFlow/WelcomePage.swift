//
//  WelcomePage.swift
//  OnBoardingFlow
//
//  Created by Ayyoub on 21/1/25.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
            }
                
            Text("Bienvenido a mi App")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("Aprendiendo Swift")
                .font(.title2)
                
        }
        
        .padding()
        
    }
}

#Preview {
    WelcomePage()
}
