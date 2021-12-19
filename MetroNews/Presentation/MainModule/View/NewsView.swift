//
//  NewsView.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 16.12.2021.
//

import UIKit

final class NewsView: UIView {
    
    // MARK: - Public Properties
    
    @IBOutlet public weak var newsTableView: UITableView!
    
    public lazy var tableViewRefreshControl = RefreshControlFactory.generateWith()
    public lazy var activityIndicator = ActivityIndicatorView(color: .black, style: .large)
    public var refreshControlPulled: (() -> Void)?
    
    public let loadingLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .black
        $0.text = "loading".localized()
        return $0
    }(UILabel())
    
    public lazy var errorContainerView: ErrorView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = AppColor.viewBGColor
        $0.alpha = 0
        return $0
    }(ErrorView())
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInitFor(view: NewsView.self, onView: self)
        registerCell()
        setupTableView()
        addSubviews()
        setupLayout()
        setupRefreshControl()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Actions
    
    @objc private func refreshData(sender: UIRefreshControl) {
        refreshControlPulled?()
    }
    
    // MARK: - Public Methods
    
    public func animate(view: UIView, value: CGFloat) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: .curveEaseIn
        ) { view.alpha = value }
    }
    
    public func setupErrorContainerOn(view: UIView) {
        view.addSubview(errorContainerView)
        NSLayoutConstraint.activate([
            errorContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            errorContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Private Methods
    
    private func setupRefreshControl() {
        newsTableView.refreshControl = tableViewRefreshControl
        tableViewRefreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    private func addSubviews() {
        addSubview(activityIndicator)
        addSubview(loadingLabel)
    }
    
    private func registerCell() {
        newsTableView.register(cell: InfoTwitterCell.self)
        newsTableView.register(cell: CellWithPicture.self)
        newsTableView.register(cell: CellWithoutPicture.self)
    }
    
    private func setupTableView() {
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.autoresizesSubviews = true
        newsTableView.showsVerticalScrollIndicator = false
        newsTableView.alpha = 0
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            loadingLabel.centerXAnchor.constraint(equalTo: newsTableView.centerXAnchor),
            loadingLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 50)
        ])
    }
    
}
