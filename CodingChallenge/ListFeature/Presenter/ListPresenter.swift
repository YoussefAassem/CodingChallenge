//
//  ListPresenter.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/23/21.
//

import UIKit

class ListPresenter {
    struct Dependencies {
        weak var view: ListViewProtocol?
        let interactor: ListInteractor
        let wireframe: ListWireframe
    }

    private let deps: Dependencies
    private var products: [Product]?

    init(dependencies: Dependencies) {
        self.deps = dependencies
    }
}

// MARK:- ListPresenter Protocol Implementation
extension ListPresenter: ListPresenterProtocol {
    func updateView() {
        self.deps.interactor.fetchProducts()
    }

    func didSelectProduct(index: Int) {
        guard let products = self.products, products.count > index else { return }
        guard let viewController = self.deps.view as? UIViewController, let navController = viewController.navigationController else { return }
        self.deps.wireframe.pushToProductDetail(with: products[index], navigationController: navController)
    }
}

// MARK:- ListInteractorDelegate Protocol Implementation
extension ListPresenter: ListInteractorDelegate {
    func didFetch(_ products: [Product]) {
        self.products = products
        let viewData = ListFormatter.prepare(products: products)
        self.deps.view?.show(viewData)
    }

    func didFail(with error: ErrorModel) {
        self.deps.view?.showError(error.rawValue)
    }
}
