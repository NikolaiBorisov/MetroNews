//
//  StringURL.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 17.12.2021.
//

import Foundation

enum StringURL {
    static let newsURL = "https://devapp.mosmetro.ru/api/tweets/v1.0/"
    
    static let singleTweetURL = { (id: Int) in
        "https://twitter.com/MetroOperativno/status/\(id)"
    }
}
