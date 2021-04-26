//
//  ListInteractor.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/23/21.
//

import Foundation

protocol ListInteractorDelegate: AnyObject {
    func didFetch(_ products: [Product])
    func didFail(with error: ErrorModel)
}

enum ErrorModel: String, Error {
    case remoteHostError = "Data couldn't be fetched"
    case noProducts = "The product list is empty"
}

class ListInteractor {
    private let service: ListServiceProtocol
    private weak var delegate: ListInteractorDelegate?

    init(service: ListServiceProtocol) {
        self.service = service
    }

    func setDelegate(_ delegate: ListInteractorDelegate) {
        self.delegate = delegate
    }

    func fetchProducts() {
        service.retrieveProducts { response in
            switch response {
            case .success(let products):
                products.products.isEmpty ? self.delegate?.didFail(with: ErrorModel.noProducts) : self.delegate?.didFetch(products.products)
            case .failure:
                self.delegate?.didFail(with: ErrorModel.remoteHostError)
            }
        }
    }
}
