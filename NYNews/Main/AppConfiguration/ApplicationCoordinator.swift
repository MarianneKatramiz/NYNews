//
//  ApplicationCoordinator.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import Alamofire

class ApplicationCoordinator: NSObject, Coordinator {
    
    lazy var reachabilityManager: ReachabilityManager = {
        let manager = ReachabilityManager(window: window)
        return manager
    }()
    
    let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {

        // init Reachability Manager
        reachabilityManager.startNetworkReachabilityObserver()
        
        // Start Application
        self.startApp()
    }
}

// MARK: - Application Start
extension ApplicationCoordinator {
    
    func startApp() {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let window = appDelegate.window else { return }

        let navigationController = NewsNavigationController()
        let coordinator = NewsCoordinator(navigationController: navigationController)
        window.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        coordinator.start()
    }
}
