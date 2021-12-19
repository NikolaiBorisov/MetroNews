//
//  NewsViewModel.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 17.12.2021.
//

import UIKit

final class NewsViewModel {
    
    // MARK: - Public Properties
    
    public lazy var mainView = NewsView()
    public var news: NewsDTO?
    
    // MARK: - Private Properties
    
    private var dataFetcherService = DataFetcherService()
    private var internetAvailabilityService = InternetAvailabilityService()
    
    // MARK: - Public Methods
    
    public func getData(completion: @escaping (AppError) -> Void?) {
        mainView.activityIndicator.startAnimating()
        dataFetcherService.fetchNews { [weak self] result in
            switch result {
            case .failure(let error):
                guard let self = self else { return }
                self.mainView.activityIndicator.stopAnimating()
                self.mainView.loadingLabel.isHidden = true
                completion(error)
                print(error)
            case .success(let news):
                guard let self = self else { return }
                self.news = news
                self.mainView.newsTableView.reloadData()
                self.mainView.activityIndicator.stopAnimating()
                self.mainView.loadingLabel.removeFromSuperview()
                self.mainView.tableViewRefreshControl.endRefreshing()
                self.mainView.animate(view: self.mainView.newsTableView, value: 1)
            }
        }
    }
    
    public func setupCallback(completion: @escaping (AppError) -> Void?) {
        mainView.refreshControlPulled = { [weak self] in
            guard let self = self else { return }
            self.getData(completion: completion)
        }
        
        mainView.errorContainerView.reloadButtonTapped = { [weak self] in
            guard let self = self else { return }
            guard self.internetAvailabilityService.isInternetAvailable() else { return }
            self.getData(completion: completion)
            self.mainView.animate(view: self.mainView.errorContainerView, value: 0)
            self.mainView.loadingLabel.isHidden = false
            self.mainView.animate(view: self.mainView.newsTableView, value: 1)
            self.mainView.errorContainerView.removeFromSuperview()
        }
    }
    
    public func openSite(urlString: String) {
        let appShared = UIApplication.shared
        guard let url = URL(string: urlString),
              appShared.canOpenURL(url) else { return }
        appShared.open(url, options: [:], completionHandler: nil)
    }
    
}
