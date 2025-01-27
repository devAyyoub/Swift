//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Ayyoub on 26/1/25.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie : Movie
    let isNew : Bool
    
    @Environment(\.dismiss) private var dimiss
    @Environment(\.modelContext) private var context
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }
    
    var sortedFriends : [Friend] {
        movie.favoritedBy.sorted { first, second in
            first.name < second.name
        }
    }
    
    var body: some View {
        Form {
            TextField("Movie name", text: $movie.title)
                
            DatePicker("Release Date", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favoritedBy.isEmpty {
                Section ("Favorited by"){
                    ForEach(sortedFriends) { friend in
                        Text(friend.name)
                    }
                }
            }
            
        }
        .navigationTitle(isNew ? "New Movie" : "Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem (placement: .confirmationAction){
                    Button("Save") {
                        dimiss()
                    }
                }
                ToolbarItem (placement: .cancellationAction){
                    Button("Cancel") {
                        dimiss()
                        context.delete(movie)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
    }
}
