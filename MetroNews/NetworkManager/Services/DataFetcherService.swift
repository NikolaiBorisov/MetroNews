//
//  DataFetcherService.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 17.12.2021.
//

import UIKit

/// Class fetches data from DTOModel
final class DataFetcherService {
    
    // MARK: - Private Properties
    
    private var dataFetcher: DataFetcher
    
    // MARK: - Initializers
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    // MARK: - Public Methods
    
    /// Method fetches news from NewsDTO using URL
    func fetchNews(completion: @escaping (Result<NewsDTO?, AppError>) -> Void) {
        let urlString = StringURL.newsURL
        dataFetcher.fetchJSONData(urlString: urlString, completion: completion)
    }
    
}
