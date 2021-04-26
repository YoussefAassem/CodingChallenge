//
//  DetailViewController.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/24/21.
//

import UIKit

// MARK:- Protocols
protocol DetailViewProtocol: AnyObject {
    func update(with viewData: DetailViewData)
    func setPresenter(_ presenter: DetailPresenterProtocol)
}

protocol DetailPresenterProtocol {
    func updateView()
}

// MARK:- UI component Initialization
class DetailViewController: UIViewController {
    private var presenter: DetailPresenterProtocol?
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 20
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()

    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 30)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        return lbl
    }()

    private let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 28)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        return lbl
    }()

    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFont.systemFont(ofSize: 28)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        return lbl
    }()

    override func viewDidLoad() {
        self.setupView()
        self.presenter?.updateView()
    }

    func setupView() {
        self.view.backgroundColor = .white
        addStack()
        addTitleLabel()
        addPriceLabel()
        addDescriptionLabel()
    }
}

private extension DetailViewController {
    func addStack() {
        self.view.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        self.stackView.heightAnchor.constraint(lessThanOrEqualTo: self.view.heightAnchor, multiplier: 2 / 4).isActive = true
    }

    func addTitleLabel() {
        self.stackView.addArrangedSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor).isActive = true
    }

    func addPriceLabel() {
        self.stackView.addArrangedSubview(self.priceLabel)
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.priceLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor).isActive = true
    }

    func addDescriptionLabel() {
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor).isActive = true
    }
}

// MARK:- Protocol Implementation
extension DetailViewController: DetailViewProtocol {
    func update(with viewData: DetailViewData) {
        self.titleLabel.text = viewData.title
        self.priceLabel.text = viewData.price
        self.descriptionLabel.text = viewData.description
    }

    func setPresenter(_ presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
}
