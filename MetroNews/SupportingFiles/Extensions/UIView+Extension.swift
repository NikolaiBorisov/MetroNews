//
//  UIView+Extension.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 16.12.2021.
//

import UIKit

// MARK: - CellIdentifier

/// Use class name for cellIdentifier. Return class name. Use it in Register cells
extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

// MARK: - CornerRadius

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}

// MARK: - CommonInit

/// Get .xib from bundle by its name. Set frame according his parent's bounds. Add as a subview for parent view
extension UIView {
    func commonInitFor<T: UIView>(view: T.Type, onView: UIView) {
        let xibView = Bundle.main.loadNibNamed(T.identifier, owner: self, options: nil)?[0] as? UIView
        xibView?.frame = onView.bounds
        guard let xibView = xibView else { return }
        onView.addSubview(xibView)
    }
}

// MARK: - RoundView

extension UIView {
    func roundViewWith(cornerRadius: CGFloat = 0, borderColor: UIColor? = nil, borderWidth: CGFloat = 0) {
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
    }
}
