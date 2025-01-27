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

    var body: some View {
        Form {
            TextField("Movie name", text: $movie.title)
                
            DatePicker("Release Date", selection: $movie.releaseDate, displayedComponents: .date)
            
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
