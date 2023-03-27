//
//  AddTrackerViewController.swift
//  Tracker
//
//  Created by Andrey Sysoev on 27.03.2023.
//

import UIKit

final class AddTrackerViewController: UIViewController {
    // MARK: - Layout elements
    
    private lazy var addHabitButton: UIButton = {
        let button = Button(title: "Привычка")
        button.addTarget(self, action: #selector(didTapAddHabitButton), for: .touchUpInside)
        return button
    }()
    private lazy var addIrregularEventButton: UIButton = {
        let button = Button(title: "Нерегулярное событие")
        button.addTarget(self, action: #selector(didTapAddIrregularEventButton), for: .touchUpInside)
        return button
    }()
    private let buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    // MARK: - Properties
    
    private var isRegular = false

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContent()
        setupConstraints()
    }
    
    // MARK: - Actions
    
    @objc
    private func didTapAddHabitButton() {
        title = "Новая привычка"
        isRegular = true
        buttonsStack.isHidden = true
    }
    
    @objc
    private func didTapAddIrregularEventButton() {
        title = "Новое нерегулярное событие"
        isRegular = false
        buttonsStack.isHidden = true
    }
}

// MARK: - Layout methods

private extension AddTrackerViewController {
    func setupContent() {
        title = "Создание трекера"
        view.backgroundColor = .white
        
        view.addSubview(buttonsStack)
        
        buttonsStack.addArrangedSubview(addHabitButton)
        buttonsStack.addArrangedSubview(addIrregularEventButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // buttonsStack
            buttonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonsStack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            buttonsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            // addHabitButton
            addHabitButton.heightAnchor.constraint(equalToConstant: 60),
            // addIrregularEventButton
            addIrregularEventButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
