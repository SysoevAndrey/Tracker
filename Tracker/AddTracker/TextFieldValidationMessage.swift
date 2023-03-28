//
//  TextFieldValidationMessage.swift
//  Tracker
//
//  Created by Andrey Sysoev on 28.03.2023.
//

import UIKit

final class TextFieldValidationMessage: UICollectionReusableView {
    // MARK: - Layout elements
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .red
        label.text = "Ограничение 38 символов"
        return label
    }()
    
    // MARK: - Properties
    
    static let identifier = "TextFieldValidationMessage"
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: topAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
