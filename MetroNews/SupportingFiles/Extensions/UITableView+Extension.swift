//
//  UITableView+Extension.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 16.12.2021.
//

import UIKit

// MARK: - Register and DequeueCell for UITableViewCell

extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) {
        register(UINib(nibName: T.identifier, bundle: .main), forCellReuseIdentifier: T.identifier)
    }
    
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
