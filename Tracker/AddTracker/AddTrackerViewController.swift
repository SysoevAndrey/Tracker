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
    private let collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isHidden = true
        collection.register(TextFieldCell.self, forCellWithReuseIdentifier: TextFieldCell.identifier)
        collection.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
        collection.register(
            TextFieldValidationMessage.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: TextFieldValidationMessage.identifier
        )
        return collection
    }()
    
    // MARK: - Properties
    
    private var labelText = ""
    private var category: String?
    private var schedule: [WeekDay]?
    
    private var isConfirmButtonEnabled: Bool {
        labelText.count > 0 && !isValidationMessageVisible
    }
    
    private var isValidationMessageVisible = false
    private var parameters = ["Категория", "Расписание"]
    private let emojis = [
        "🙂", "😻", "🌺", "🐶", "❤️", "😱",
        "😇", "😡", "🥶", "🤔", "🙌", "🍔",
        "🥦", "🏓", "🥇", "🎸", "🏝", "😪",
    ]
    private let colors = [
        UIColor(named: "Color selection 1"),
        UIColor(named: "Color selection 2"),
        UIColor(named: "Color selection 3"),
        UIColor(named: "Color selection 4"),
        UIColor(named: "Color selection 5"),
        UIColor(named: "Color selection 6"),
        UIColor(named: "Color selection 6"),
        UIColor(named: "Color selection 7"),
        UIColor(named: "Color selection 8"),
        UIColor(named: "Color selection 9"),
        UIColor(named: "Color selection 10"),
        UIColor(named: "Color selection 11"),
        UIColor(named: "Color selection 12"),
        UIColor(named: "Color selection 13"),
        UIColor(named: "Color selection 14"),
        UIColor(named: "Color selection 15"),
        UIColor(named: "Color selection 16"),
        UIColor(named: "Color selection 17"),
        UIColor(named: "Color selection 18"),
    ]

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
        schedule = []
        buttonsStack.isHidden = true
        collectionView.isHidden = false
        collectionView.reloadData()
    }
    
    @objc
    private func didTapAddIrregularEventButton() {
        title = "Новое нерегулярное событие"
        schedule = nil
        buttonsStack.isHidden = true
        collectionView.isHidden = false
        collectionView.reloadData()
    }
}

// MARK: - Layout methods

private extension AddTrackerViewController {
    func setupContent() {
        title = "Создание трекера"
        view.backgroundColor = .white
        
        view.addSubview(buttonsStack)
        view.addSubview(collectionView)
        
        buttonsStack.addArrangedSubview(addHabitButton)
        buttonsStack.addArrangedSubview(addIrregularEventButton)
        
        collectionView.dataSource = self
        collectionView.delegate = self
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
            // collectionView
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension AddTrackerViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return schedule != nil ? 2 : 1
        case 2: return emojis.count
        case 3: return colors.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextFieldCell.identifier, for: indexPath) as? TextFieldCell else { return UICollectionViewCell() }
            cell.delegate = self
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as? ListCell else { return UICollectionViewCell() }
            var position: ListItem.Position
            
            if schedule == nil {
                position = .alone
            } else {
                position = indexPath.row == 0 ? .first : .last
            }
            
            cell.configure(label: parameters[indexPath.row], position: position)
            return cell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AddTrackerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        switch indexPath.section {
        case 0, 1: return CGSize(width: collectionView.bounds.width - 32, height: 75)
        default: return .zero
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        switch section {
        case 0, 1: return 0
        default: return 0
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets
    {
        switch section {
        case 0, 1:
            return UIEdgeInsets(top: 24, left: 16, bottom: 8, right: 16)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView
    {
        switch indexPath.section {
        case 0:
            guard
                kind == UICollectionView.elementKindSectionFooter,
                let view = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: TextFieldValidationMessage.identifier,
                    for: indexPath
                ) as? TextFieldValidationMessage
            else { return UICollectionReusableView() }
            return view
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForFooterInSection section: Int) -> CGSize
    {
        guard section == 0, isValidationMessageVisible else { return .zero }
        
        let indexPath = IndexPath(row: 0, section: section)
        let footerView = self.collectionView(
            collectionView,
            viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionFooter,
            at: indexPath
        )
        
        return footerView.systemLayoutSizeFitting(
            CGSize(
                width: collectionView.frame.width,
                height: UIView.layoutFittingExpandedSize.height
            ),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
    }
}

// MARK: - TextFieldCellDelegate

extension AddTrackerViewController: TextFieldCellDelegate {
    func didChangedLabelTextField(text: String) {
        labelText = text
        if text.count > 38 {
            isValidationMessageVisible = true
        } else {
            isValidationMessageVisible = false
        }
        collectionView.collectionViewLayout.invalidateLayout()
    }
}
