//
//  Friend.swift
//  Birthdays
//
//  Created by Ayyoub on 25/1/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name : String
    var birthday : Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthDayToday : Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
