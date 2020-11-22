//
//  ToastUtils.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import Toast_Swift

class ToastUtils: NSObject {

    // This is the "shared" instance of this class that is created only once
    static let shared = ToastUtils()
    
    private override init() {
        super.init()
    }
    
    /// Show toast messag on the bottom of the screen
    /// - Parameters:
    ///   - msg: The message to be displayed
    ///   - duration: The toast duration, default duration 3.0 second
    func showToast(_ msg: String, _ duration: Double = 3.0) {
        let topView = UIApplication.topViewController() ?? UIViewController()
        topView.navigationController?.view.makeToast(msg, duration: duration)
    }
}
