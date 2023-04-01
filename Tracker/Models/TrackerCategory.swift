//
//  TrackerCategory.swift
//  Tracker
//
//  Created by Andrey Sysoev on 25.03.2023.
//

import UIKit

struct TrackerCategory {
    var label: String
    var trackers: [Tracker]
}

extension TrackerCategory {
    static var sampleData: [TrackerCategory] = [
        TrackerCategory(
            label: "Домашний уют",
            trackers: [
//                Tracker(
//                    label: "Поливать растения",
//                    emoji: "❤️",
//                    color: UIColor(named: "Color selection 5")!,
//                    schedule: [.saturday]
//                )
            ]
        ),
        TrackerCategory(
            label: "Радостные мелочи",
            trackers: [
//                Tracker(
//                    label: "Кошка заслонила камеру на созвоне",
//                    emoji: "😻",
//                    color: UIColor(named: "Color selection 2")!,
//                    schedule: nil
//                ),
//                Tracker(
//                    label: "Бабушка прислала открытку в вотсапе",
//                    emoji: "🌺",
//                    color: UIColor(named: "Color selection 1")!,
//                    schedule: nil
//                ),
//                Tracker(
//                    label: "Свидания в апреле",
//                    emoji: "❤️",
//                    color: UIColor(named: "Color selection 14")!,
//                    schedule: nil
//                ),
            ]
        )
    ]
}
