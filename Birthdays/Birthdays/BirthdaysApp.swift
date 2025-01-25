//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Ayyoub on 25/1/25.
//

import SwiftUI

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
