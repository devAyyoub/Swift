//
//  FriendList.swift
//  FriendsFavoriteMovies
//
//  Created by Ayyoub on 25/1/25.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Query(sort: \Friend.name) private var friends : [Friend]
    @Environment(\.modelContext) private var context
    @State private var newFriend : Friend?
    
    init(titletFilter: String = "") {
        let predicate = #Predicate<Friend> { friend in
            titletFilter.isEmpty || friend.name.localizedStandardContains(titletFilter)
        }
        
        _friends = Query(filter: predicate, sort: \Friend.name)
    }
    
    var body: some View {
            Group {
                if !friends.isEmpty {
                    List {
                        ForEach(friends) { friend in
                            NavigationLink(friend.name) {
                                FriendDetail(friend: friend)
                            }
                        }
                        .onDelete(perform: deleteFriend(indexes:))
                    }
                } else {
                    ContentUnavailableView("Add friends", systemImage: "person.and.person")
                }
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem {
                    Button("Add friend", systemImage: "plus", action: addFriend)
                }
                ToolbarItem (placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(item: $newFriend) { friend in
                NavigationStack {
                    FriendDetail(friend: friend, isNew: true)
                }
                .interactiveDismissDisabled()
            }
    }
    
    private func addFriend() {
//        context.insert(Friend(name: "New friend"))
        let newFriend = Friend(name: "")
        context.insert(newFriend)
        self.newFriend = newFriend
    }
    
    private func deleteFriend(indexes: IndexSet) {
        for index in indexes {
            context.delete(friends[index])
        }
    }
 }

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview ("Filtered") {
    NavigationStack {
        FriendList(titletFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview ("Empty list") {
    NavigationStack {
        FriendList()
            .modelContainer(for: Friend.self, inMemory: true)
    }
}
