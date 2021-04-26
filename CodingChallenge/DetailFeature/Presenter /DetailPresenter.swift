//
//  DetailPresenter.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/24/21.
//

import Foundation

class DetailPresenter {
    private weak var view: DetailViewProtocol?
    private var product: Product

    init(view: DetailViewProtocol?, product: Product) {
        self.view = view
        self.product = product
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    func updateView() {
        let viewData = DetailFormatter.prepare(product: product)
        view?.update(with: viewData)
    }
}
