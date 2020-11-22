//
//  NewsDetailViewModel.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import RxSwift

class NewsDetailViewModel: BaseViewModel {
    private let coordinator: NewsCoordinator

    var newsDetail: NewsDetailModel!

    init(coordinator: NewsCoordinator) {
        self.coordinator = coordinator
    }
}
