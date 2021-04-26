//
//  ListViewCell.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/24/21.
//

import Foundation
import UIKit.UITableViewCell

class ListViewCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let title = UILabel()
        return title
    }()

    private let descriptionLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        return title
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 20
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpCell()
    }

    func updateCell(with viewData: ListViewData) {
        setUpCell()
        self.titleLabel.text = viewData.title
        self.descriptionLabel.text = viewData.description
    }
}

private extension ListViewCell {
    
    func setupTitleLabel() {
        self.stackView.addArrangedSubview(titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.stackView.topAnchor).isActive = true
    }

    func setupDescriptionLabel() {
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
        self.descriptionLabel.widthAnchor.constraint(lessThanOrEqualTo: self.stackView.widthAnchor, multiplier: 0.95).isActive = true
        self.descriptionLabel.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor).isActive = true
    }
    func setupStack() {
        self.contentView.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }

    func setUpCell() {
        self.setupStack()
        self.setupTitleLabel()
        self.setupDescriptionLabel()
    }
}
