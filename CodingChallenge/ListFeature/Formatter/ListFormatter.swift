//
//  ListFormatter.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/24/21.
//

import Foundation

struct ListFormatter {
    static func prepare(products: [Product]) -> [ListViewData] {
        return products.map { ListViewData(title: "\($0.title): $\($0.value) (\($0.currency))", description: "Description: " + (Utils.getConvenientLabel(label: $0.description) ?? "")) }
    }
}
