//
//  DateFormatterFactory.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 18.12.2021.
//

import UIKit

/// Class creates dateFormatter and convert date from Epoch Date
final class DateFormatterFactory {
    
    static func generateWith(format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
    
    static func convertFromEpochDate(time: Int, with format: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        return generateWith(format: format).string(from: date)
    }
    
}
