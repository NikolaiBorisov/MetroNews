//
//  ErrorView.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 18.12.2021.
//

import UIKit

/// Class displays an Error view
final class ErrorView: UIView {
    
    // MARK: - Public Properties
    
    public var reloadButtonTapped: (() -> Void)?
    
    public let subErrorLabel: UILabel = {
        $0.textAlignment = .center
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 15)
        $0.numberOfLines = 0
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    // MARK: - Private Properties
    
    private let screenWidth = UIScreen.main.bounds.width
    
    private var errorImageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.image = AppImage.error
        return $0
    }(UIImageView())
    
    private let errorLabel: UILabel = {
        $0.textAlignment = .center
        $0.textColor = .label
        $0.font = .boldSystemFont(ofSize: 20)
        $0.text = "error".localized()
        return $0
    }(UILabel())
    
    private lazy var labelStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [errorLabel, subErrorLabel]))
    
    private lazy var reloadButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("tryAgain".localized(), for: .normal)
        $0.backgroundColor = AppColor.fantasyColor
        $0.setTitleColor(AppColor.alizarinCrimsonColor, for: .normal)
        return $0
    }(UIButton(type: .system))
    
    private lazy var labelAndButtonStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.spacing = 16
        return $0
    }(UIStackView(arrangedSubviews: [labelStackView, reloadButton]))
    
    private lazy var mainStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.spacing = 35
        return $0
    }(UIStackView(arrangedSubviews: [errorImageView, labelAndButtonStackView]))
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        addSubviews()
        setupLayout()
        setupButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func onButtonTapped(sender: UIButton) {
        reloadButtonTapped?()
    }
    
    // MARK: - Private Methods
    
    private func setupButtonAction() {
        reloadButton.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
    }
    
    private func setupView() {
        backgroundColor = AppColor.viewBGColor
        reloadButton.roundViewWith(cornerRadius: 8)
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            errorImageView.heightAnchor.constraint(equalToConstant: 92),
            reloadButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
}
