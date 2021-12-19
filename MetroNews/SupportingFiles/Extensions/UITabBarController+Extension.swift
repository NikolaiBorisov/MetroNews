//
//  UITabBarController+Extension.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 16.12.2021.
//

import UIKit

// MARK: - Set SelectedIndex for UITabBarController

extension UITabBarController {
    @IBInspectable var selectedIndex: Int {
        get {
            return self.selectedIndex
        }
        set(index) {
            self.selectedIndex = index
        }
    }
}
