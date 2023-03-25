//
//  Tracker.swift
//  Tracker
//
//  Created by Andrey Sysoev on 25.03.2023.
//

import UIKit

struct Tracker: Identifiable {
    let id: UUID
    var label: String
    var emoji: String
    var color: UIColor
    var schedule: [WeekDay]?
    
    init(id: UUID = UUID(), label: String, emoji: String, color: UIColor, schedule: [WeekDay]?) {
        self.id = id
        self.label = label
        self.emoji = emoji
        self.color = color
        self.schedule = schedule
    }
}

enum WeekDay: String {
    case monday = "Понедельник"
    case tuesday = "Вторник"
    case wednesday = "Среда"
    case thurshday = "Четверг"
    case friday = "Пятница"
    case saturday = "Суббота"
    case sunday = "Воскресенье"
}
