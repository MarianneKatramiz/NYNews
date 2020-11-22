//
//  NewsList+TableView.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

extension NewsViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.newsList.count != 0 {
            return viewModel.newsList.count
        } else {
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.newsList.count != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as? NewsTableViewCell ?? NewsTableViewCell()
            cell.loadNews(viewModel.newsList[indexPath.row])
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier, for: indexPath) as? EmptyTableViewCell ?? EmptyTableViewCell()
            cell.titleLabel?.text = isNoData ? Constants.Strings.messageNoData : ""
            cell.separatorInset = UIEdgeInsets(top: 0, left: 10000, bottom: 0, right: 0)
            return cell
        }
    }
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if viewModel.newsList.count != 0 {
            viewModel.openNewsDetails(viewModel.newsList[indexPath.row])
        }
    }
}
