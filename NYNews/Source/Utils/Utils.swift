//
//  Utils.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

class Utils: NSObject {

    /// This method/function was designed & implemented to: Performa a delay clousre if needed
    ///
    /// - Parameters:
    ///   - delay: How long you want to delay
    ///   - closure: The closure
    static func delay(delay: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
}
