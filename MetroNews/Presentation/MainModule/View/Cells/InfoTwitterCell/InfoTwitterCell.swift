//
//  InfoTwitterCell.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 16.12.2021.
//

import UIKit

final class InfoTwitterCell: UITableViewCell {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var moscowMetroLabel: UILabel!
    @IBOutlet private weak var metroOperativnoLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var cellBackgroundView: UIView!
    
    // MARK: - Life Cycle
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setupView()
    }
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInitFor(view: InfoTwitterCell.self, onView: contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        let shadowPath = UIBezierPath(roundedRect: cellBackgroundView.bounds, cornerRadius: 8).cgPath
        cellBackgroundView.layer.shadowPath = shadowPath
        cellBackgroundView.layer.shadowColor = UIColor.black.withAlphaComponent(0.16).cgColor
        cellBackgroundView.layer.shadowOpacity = 1
        cellBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellBackgroundView.layer.shadowRadius = 8
    }
    
}
