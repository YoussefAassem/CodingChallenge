//
//  ListProducts.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/25/21.
//

import Foundation

struct ListProducts: Decodable {
    var products: [Product]

    enum CodingKeys: String, CodingKey {
        case products = "data"
    }
}
