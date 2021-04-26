//
//  ListViewController.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/23/21.
//

import UIKit

// MARK: - Protocols

protocol ListViewProtocol: AnyObject {
    func setPresenter(_ presenter: ListPresenterProtocol)
    func showError(_ error: String)
    func show(_ viewData: [ListViewData])
}

protocol ListPresenterProtocol: AnyObject {
    func updateView()
    func didSelectProduct(index: Int)
}

protocol ListViewDataSource: AnyObject {
    func numberOfItems() -> Int
    func itemViewData(index: Int) -> Product?
}

// MARK: - Class definition

class ListViewController: UIViewController {
    private var presenter: ListPresenterProtocol?
    private var tableView: UITableView?
    private let cellIdentifier = "ListCell"
    private let messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()

    private var productsList: [ListViewData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter?.updateView()
    }
}

private extension ListViewController {
    func setupTableView() {
        guard let tableView = self.tableView else { return }
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }

    func initTableView() {
        self.tableView = UITableView()
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.register(ListViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.tableFooterView = UIView()
    }

    func setupErrorLabel() {
        self.messageLabel.frame = view.frame
        self.messageLabel.center = self.view.center
        self.view.addSubview(self.messageLabel)
    }

    func setupView() {
        self.initTableView()
        self.setupTableView()
        self.setupErrorLabel()
    }
}

// MARK: - ListView Protocol Implementation

extension ListViewController: ListViewProtocol {
    func show(_ viewData: [ListViewData]) {
        self.productsList = viewData
        self.tableView?.reloadData()
    }

    func setPresenter(_ presenter: ListPresenterProtocol) {
        self.presenter = presenter
    }

    func showError(_ error: String) {
        self.messageLabel.text = error
    }
}

// MARK: - TableView's Delegate & Datasource implementations

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? ListViewCell
        guard let tableCell = cell else { return UITableViewCell() }
        let item = self.productsList[indexPath.row]
        tableCell.updateCell(with: item)
        return tableCell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemsCount = self.productsList.count
        if itemsCount > 0 {
            self.presenter?.didSelectProduct(index: indexPath.row)
        }
    }
}
