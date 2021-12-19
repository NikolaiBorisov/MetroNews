//
//  CellWithPicture.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 17.12.2021.
//

import UIKit
import SDWebImage

final class CellWithPicture: UITableViewCell {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var newsTextLabel: UILabel!
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var retweetLabel: UILabel!
    @IBOutlet private weak var likeLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    // MARK: - Private Properties
    
    private var imageCachingService = ImageCachingService()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInitFor(view: CellWithPicture.self, onView: contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    
    private func setupTweetDateWith(epochTime: Int) {
        let date = DateFormatterFactory.convertFromEpochDate(
            time: epochTime,
            with: DateFormat.MMM_dd_hh_mm_a
        )
        timeLabel.text = date
    }
    
}

// MARK: - NewsCellProtocol

extension CellWithPicture: NewsCellProtocol {
    
    func configureCellWith(item: Tweet) {
        let date = item.createdAt
        setupTweetDateWith(epochTime: date)
        
        newsTextLabel.text =  item.text
        retweetLabel.text = "\(item.retweetCount)"
        likeLabel.text = "\(item.favoriteCount)"
        
        guard let url = item.mediaEntities?.first else { return }
        mainImage.setupImageWith(url: url)
    }
    
}
