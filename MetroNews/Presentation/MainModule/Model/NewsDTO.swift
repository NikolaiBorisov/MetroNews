//
//  NewsDTO.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 17.12.2021.
//

import Foundation
import SwiftyJSON

// MARK: - NewsDTO

struct NewsDTO: Codable {
    let success: Bool
    let data: [Tweet]
    
    init(json: JSON) {
        success = json["success"].boolValue
        data = json["data"].arrayObject as? [Tweet] ?? []
    }
}

// MARK: - Tweet

struct Tweet: Codable {
    let id: Int
    let text: String
    let createdAt: Int
    let retweetCount: Int
    let favoriteCount: Int
    let mediaEntities: [String]?
    
    init(json: JSON) {
        id = json["id"].intValue
        text = json["text"].stringValue
        createdAt = json["createdAt"].intValue
        retweetCount = json["retweetCount"].intValue
        favoriteCount = json["favoriteCount"].intValue
        mediaEntities = json["mediaEntities"].arrayObject as? [String]
    }
}
