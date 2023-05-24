//
//  StatisticsViewController.swift
//  Tracker
//
//  Created by Andrey Sysoev on 24.03.2023.
//

import UIKit

final class StatisticsViewController: UIViewController {
    
    // MARK: - Layout elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = L10n.Statistics.title
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return label
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContent()
        setupConstraints()
    }

}

// MARK: - Layout methods

private extension StatisticsViewController {
    func setupContent() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // titleLabel
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
        ])
    }
}
