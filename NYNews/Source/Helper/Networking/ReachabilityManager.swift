//
//  ReachabilityManager.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import Alamofire

/// This class was designed and implemented to check internet connection
class ReachabilityManager {
    
    /// Reachability Manager
    let reachabilityManager: NetworkReachabilityManager = {
        return NetworkReachabilityManager()!
    }()
    
    /// Application window
    private let window: UIWindow
    
    /// init
    init(window: UIWindow) {
        self.window = window
    }
    
    /// Start Network Reachability Observer
    func startNetworkReachabilityObserver() {
        reachabilityManager.listener = { status in
            switch status {
            case .notReachable:
                print("The network is not reachable")
                MessagesBuilder.shared.showMessage(title: Constants.Strings.no_internet, messageType: .error)
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable ethernetOrWiFi")
            case .reachable(.wwan):
                print("The network is reachable wwan")
            case .unknown:
                print("It is unknown whether the network is reachable")
            }
        }
        
        // Start Listening
        reachabilityManager.startListening()
    }
    
    /// Stop Network Reachability Observer
    func stopNetworkReachabilityObserver() {
        reachabilityManager.listener = nil
        reachabilityManager.stopListening()
    }
    
    /// Check connection
    ///
    /// - Returns: boolean value
    func isConnected() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
