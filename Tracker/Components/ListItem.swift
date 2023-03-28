//
//  ListItem.swift
//  Tracker
//
//  Created by Andrey Sysoev on 28.03.2023.
//

import UIKit

final class ListItem: UIView {
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configure(with position: Position = .middle) {
        let borderWidth: CGFloat = 0.5
        let border = CALayer()
        border.backgroundColor = UIColor.gray.cgColor
        border.frame = CGRectMake(16, self.frame.size.height - borderWidth, self.frame.size.width - 32, borderWidth)
        
        layer.masksToBounds = true
        layer.cornerRadius = 10
        
        switch position {
        case .first:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            layer.addSublayer(border)
        case .middle:
            layer.cornerRadius = 0
            layer.addSublayer(border)
        case .last:
            layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .alone:
            break
        }
    }
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 16
        self.backgroundColor = .background
    }
}

extension ListItem {
    enum Position {
        case first, middle, last, alone
    }
}
