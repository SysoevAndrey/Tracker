//
//  ListCell.swift
//  Tracker
//
//  Created by Andrey Sysoev on 28.03.2023.
//

import UIKit

final class ListCell: UICollectionViewCell {
    // MARK: - Layout elements
    
    private let listItem = ListItem()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    private let chooseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    // MARK: - Properties
    
    static let identifier = "ListCell"
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContent()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configure(label: String, position: ListItem.Position) {
        listItem.configure(with: position)
        nameLabel.text = label
    }
}

// MARK: - Layout methods

private extension ListCell {
    func setupContent() {
        contentView.addSubview(listItem)
        contentView.addSubview(nameLabel)
        contentView.addSubview(chooseButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // listItem
            listItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            listItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            listItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            listItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            // nameLabel
            nameLabel.leadingAnchor.constraint(equalTo: listItem.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: listItem.centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: listItem.trailingAnchor, constant: -56),
            // chooseButton
            chooseButton.centerYAnchor.constraint(equalTo: listItem.centerYAnchor),
            chooseButton.trailingAnchor.constraint(equalTo: listItem.trailingAnchor, constant: -24),
            chooseButton.widthAnchor.constraint(equalToConstant: 8),
            chooseButton.heightAnchor.constraint(equalToConstant: 12),
        ])
    }
}
