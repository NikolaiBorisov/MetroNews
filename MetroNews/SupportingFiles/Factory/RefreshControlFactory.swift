//
//  RefreshControlFactory.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 18.12.2021.
//

import UIKit

/// Class creates refreshControl for UITableView and UICollectionView
final class RefreshControlFactory {
    
    static func generateWith(color: UIColor? = .red) -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = color
        return refreshControl
    }
    
}
