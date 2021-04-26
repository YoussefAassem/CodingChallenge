//
//  Product.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/23/21.
//

import Foundation

struct Product: Decodable {
     var itemId: String
     var value: String
     var currency: String
     var title: String
     var description: LocalizedString
}
