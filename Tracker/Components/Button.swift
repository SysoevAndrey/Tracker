//
//  Button.swift
//  Tracker
//
//  Created by Andrey Sysoev on 27.03.2023.
//

import UIKit

final class Button: UIButton {
    convenience init(color: UIColor = .black, title: String) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = color
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.layer.cornerRadius = 24
    }
    
    static func danger(title: String) -> Self {
        let button = self.init(color: .clear, title: title)
        
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        
        return button
    }
}
