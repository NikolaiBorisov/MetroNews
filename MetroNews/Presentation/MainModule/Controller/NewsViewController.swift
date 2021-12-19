//
//  NewsViewController.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 16.12.2021.
//

import UIKit

final class NewsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var viewModel = NewsViewModel()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        
        view = viewModel.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        getDataHandler()
        callbackHandler()
    }
    
    // MARK: - Private Methods
    
    private func getDataHandler() {
        viewModel.getData { error in
            self.viewModel.mainView.setupErrorContainerOn(view: self.view)
            self.viewModel.mainView.animate(view: self.viewModel.mainView.errorContainerView, value: 1)
            self.viewModel.mainView.errorContainerView.subErrorLabel.text = error.title
            return self.viewModel.mainView.animate(
                view: self.viewModel.mainView.errorContainerView,
                value: 1
            )
        }
    }
    
    private func callbackHandler() {
        viewModel.setupCallback { error in
            self.viewModel.mainView.setupErrorContainerOn(view: self.view)
            self.viewModel.mainView.errorContainerView.subErrorLabel.text = error.title
            return self.viewModel.mainView.animate(
                view: self.viewModel.mainView.errorContainerView,
                value: 1
            )
        }
    }
    
    private func setupView() {
        viewModel.mainView.newsTableView.delegate = self
        viewModel.mainView.newsTableView.dataSource = self
    }
    
}

// MARK: - UITableViewDataSource

extension NewsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            guard let objects = viewModel.news?.data else { return 0 }
            return objects.count
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: InfoTwitterCell = tableView.dequeueCell(for: indexPath)
            return cell
        case 1:
            let cell: CellWithPicture = tableView.dequeueCell(for: indexPath)
            guard let item = viewModel.news?.data[indexPath.row] else { return cell }
            cell.configureCellWith(item: item)
            return cell
        case 2:
            let cell: CellWithoutPicture = tableView.dequeueCell(for: indexPath)
            return cell
        default: return UITableViewCell()
        }
    }
    
}

// MARK: - UITableViewDelegate

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let id = viewModel.news?.data[indexPath.row].id else { return }
        switch indexPath.section {
        case 1:
            viewModel.openSite(urlString: StringURL.singleTweetURL(id))
        default:
            return
        }
    }
    
}
