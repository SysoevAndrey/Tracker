//
//  TextFieldCell.swift
//  Tracker
//
//  Created by Andrey Sysoev on 27.03.2023.
//

import UIKit

protocol TextFieldCellDelegate: AnyObject {
    func didChangedLabelTextField(text: String)
}

final class TextFieldCell: UICollectionViewCell {
    // MARK: - Layout elements
    
    private lazy var labelTextField: UITextField = {
        let textField = TextField(placeholder: "Введите название трекера")
        textField.addTarget(self, action: #selector(didChangedLabelTextField), for: .editingChanged)
        return textField
    }()
    
    // MARK: - Properties
    
    static let identifier = "TextFieldCell"
    weak var delegate: TextFieldCellDelegate?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContent()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc
    private func didChangedLabelTextField(_ sender: UITextField) {
        if let text = sender.text {
            delegate?.didChangedLabelTextField(text: text)
        }
    }
}

// MARK: - Layout methods

private extension TextFieldCell {
    func setupContent() {
        contentView.addSubview(labelTextField)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // labelTextField
            labelTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
