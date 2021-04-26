//
//  Utils.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/24/21.
//

import UIKit

enum UserLanguage: String {
    case en, fr
}

class Utils {
    private static let userLanguage = Locale.current.languageCode
    static let responseFileName = "response"
}

extension Utils {
    static func getLanguage() -> String? {
        return userLanguage
    }

    static func getConvenientLabel(label: LocalizedString) -> String? {
        guard let language = Utils.getLanguage() else { return nil }
        switch language {
        case UserLanguage.fr.rawValue:
            return label.frLabel
        default:
            return label.enLabel
        }
    }
}
