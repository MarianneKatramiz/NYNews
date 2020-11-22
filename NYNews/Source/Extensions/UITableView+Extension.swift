//
//  UITableView+Extension.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

extension UITableView {
    
    /// Begin Refresh control
    func beginRefreshing() {
        Utils.delay(delay: 0.1) {
            self.refreshControl?.beginRefreshing()
            Utils.delay(delay: 0.1) {
                self.contentOffset = CGPoint.init(x: 0, y: -60)
            }
        }
    }
    
    /// End Refresh control
    func endRefreshing() {
        Utils.delay(delay: 0.1) {
            self.refreshControl?.endRefreshing()
            Utils.delay(delay: 0.1) {
                self.contentOffset = CGPoint.init(x: 0, y: 0)
            }
        }
    }
}
