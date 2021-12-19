//
//  NewsCellProtocol.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 19.12.2021.
//

import UIKit

protocol NewsCellProtocol {
    func configureCellWith(item: Tweet)
    func setupMainImageWith(url: String)
    func setupTweetDateWith(epochTime: Int)
}
