//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Ayyoub on 26/1/25.
//

import SwiftUI

struct FriendDetail: View {
    @Bindable var friend : Friend
    let isNew : Bool
    
    @Environment(\.dismiss) private var dimiss
    @Environment(\.modelContext) private var context
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew

    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle(isNew ? "New friend" : "Friend")
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
                        context.delete(friend)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
}
