//
//  Array+Extensions.swift
//  Tracker
//
//  Created by Andrey Sysoev on 29.05.2023.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        indices ~= index ? self[index] : nil
    }
}
