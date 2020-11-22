//
//  NewsViewModel.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import RxSwift

class NewsViewModel: BaseViewModel {
    private let coordinator: NewsCoordinator

    let loading: PublishSubject<Bool> = PublishSubject()
    let result: PublishSubject<[NewsDetailModel]> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()

    // The list of News that loads in the view
    var newsList = [NewsDetailModel]()
    
    init(coordinator: NewsCoordinator) {
        self.coordinator = coordinator
    }
}

// MARK: - Data
extension NewsViewModel {
    
    func getNews() {
     
        self.loading.onNext(true)

        NewsApi.shared.getNews { (success, result, message) in
            self.loading.onNext(false)

            if success {
                self.result.onNext(result ?? [])
            } else {
                self.error.onNext(message)
            }
        }
    }
}

// MARK: - Open Screen
extension NewsViewModel {
    
    func openNewsDetails(_ newsDetail: NewsDetailModel) {
        coordinator.openNewsDetails(newsDetail)
    }
}
