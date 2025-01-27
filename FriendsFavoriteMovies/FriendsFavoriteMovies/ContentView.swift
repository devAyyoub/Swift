//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Ayyoub on 25/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab ("Friends", systemImage: "person.and.person") {
                FilteredFriendList()
            }
            
            Tab ("Movies", systemImage: "film.stack") {
                FilteredMovieList()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
