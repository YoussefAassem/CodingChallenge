//
//  ListService.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/23/21.
//

import Foundation

// MARK:- Protocol and typealias definition
typealias completion = ((Result<ListProducts, NetworkError>) -> Void)

enum NetworkError: Error {
    case remoteHostError
}

protocol ListServiceProtocol {
    func retrieveProducts(completion: @escaping completion)
}

// MARK:- Protocol implementation
class ListService: ListServiceProtocol {
    func retrieveProducts(completion: @escaping completion) {
        guard let url = Bundle.main.url(forResource: Utils.responseFileName, withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
            DispatchQueue.main.async {
                completion(.failure(NetworkError.remoteHostError))
            }
            return
        }

        let json = try? JSONDecoder().decode(ListProducts.self, from: data)
        guard let result = json else {
            DispatchQueue.main.async {
                completion(.failure(NetworkError.remoteHostError))
            }
            return
        }
        DispatchQueue.main.async {
            completion(.success(result))
        }
    }
}
