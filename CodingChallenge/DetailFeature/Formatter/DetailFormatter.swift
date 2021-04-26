//
//  DetailFormatter.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/24/21.
//

import Foundation

class DetailFormatter {
    static func prepare(product: Product) -> DetailViewData {
        return DetailViewData(title: "item: \(product.title)", price: "Price: $\(product.value) (\(product.currency))", description: "Description: \(Utils.getConvenientLabel(label: product.description) ?? "")")
    }
}
