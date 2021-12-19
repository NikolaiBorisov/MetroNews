//
//  UIImageView+Extension.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 19.12.2021.
//

import UIKit
import SDWebImage

// MARK: - Setup Image using SDWebImage

extension UIImageView {
    func setupImageWith(url: String) {
        guard let imgURL = URL(string: url) else { return }
        sd_setImage(with: imgURL, completed: nil)
    }
}

// MARK: - Setup Image using ImageCachingService

extension UIImageView {
    func setupImage(with url: String, service: ImageCachingService) {
        guard let imgURL = URL(string: url) else { return }
        service.getImageWith(url: imgURL) { [weak self] image in
            guard let self = self else { return }
            self.image = image
        }
    }
}
