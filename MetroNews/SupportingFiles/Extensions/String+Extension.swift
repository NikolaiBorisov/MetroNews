//
//  String+Extension.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 17.12.2021.
//

import UIKit

// MARK: - Localization

extension String {
    static var errorNotLocalized: String {
        return "error_not_localized"
    }
    
    func localized() -> String {
        let result = NSLocalizedString(
            self,
            tableName: nil,
            bundle: Bundle.main,
            value: .errorNotLocalized,
            comment: ""
        )
        if result == .errorNotLocalized {
            debugPrint("Error: String '\(self)' is not localized")
            return .errorNotLocalized
        }
        return result
    }
}
