//
//  NewsCoordinator.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

class NewsCoordinator: Coordinator {

    private let navigationController: NewsNavigationController

    init(navigationController: NewsNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = NewsViewModel(coordinator: self)
        let viewController = NewsViewController.create()
        viewController.viewModel = viewModel
        navigationController.viewControllers = [viewController]
    }
}

// MARK: - Open Screens
extension NewsCoordinator {
    
    func openNewsDetails(_ newsDetail: NewsDetailModel) {
        let viewModel = NewsDetailViewModel(coordinator: self)
        let viewController = NewsDetailViewController.create()
        viewController.viewModel = viewModel
        viewController.viewModel.newsDetail = newsDetail
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
