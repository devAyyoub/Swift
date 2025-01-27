//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by Ayyoub on 25/1/25.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query private var movies : [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie : Movie?
    
    init(titletFilter: String = "") {
        let predicate = #Predicate<Movie> { movie in
            titletFilter.isEmpty || movie.title.localizedStandardContains(titletFilter)
        }
        
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    
    var body: some View {
        Group {
            if !movies.isEmpty {
                List {
                    ForEach(movies) { movie in
                        NavigationLink(movie.title) {
                            MovieDetail(movie: movie)
                        }
                    }
                    .onDelete(perform: deleteMovie(indexes: ))
                }
            } else {
                ContentUnavailableView("Add Movies", systemImage: "film.stack")
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem {
                Button("Add new movie", systemImage: "plus", action: addMovie)
            }
            ToolbarItem (placement: .topBarTrailing) {
                EditButton()
            }
        }
        .sheet(item: $newMovie) { movie in
            NavigationStack {
                MovieDetail(movie: movie, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }
    
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovie(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
 }

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview ("Filtered") {
    NavigationStack {
        MovieList(titletFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview ("Empty list") {
    NavigationStack {
            MovieList()
                .modelContainer(for: Movie.self, inMemory: true)
    }
}
