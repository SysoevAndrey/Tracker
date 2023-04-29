//
//  TrackerCategory.swift
//  Tracker
//
//  Created by Andrey Sysoev on 25.03.2023.
//

import UIKit

struct TrackerCategory: Equatable {
    let id: UUID
    let label: String
    
    init(id: UUID = UUID(), label: String) {
        self.id = id
        self.label = label
    }
}
