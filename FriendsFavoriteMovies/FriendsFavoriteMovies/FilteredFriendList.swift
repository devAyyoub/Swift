//
//  FilteredFriendList.swift
//  FriendsFavoriteMovies
//
//  Created by Ayyoub on 27/1/25.
//

import SwiftUI

struct FilteredFriendList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            FriendList(titletFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FilteredFriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
