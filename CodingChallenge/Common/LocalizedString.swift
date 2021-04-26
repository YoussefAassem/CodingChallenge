//
//  LocalizedString.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/23/21.
//

import Foundation

public struct LocalizedString: Codable {
    public let enLabel: String?
    public let frLabel: String?

    enum CodingKeys: String, CodingKey {
        case enLabel = "en-CA"
        case frLabel = "fr-CA"
    }
}


