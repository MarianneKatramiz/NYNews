//
//  Constants.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()

/// Constants
struct Constants {
        
    /// App Strings
    public struct Strings {
        
        // Common strings
        static let no_internet   = "Please check your internet connection and try again later."
        static let messageNoData = "No news to display. Please try again later."
        
        // News
        static let newsPageTitle = "News"
        
        // News Detail
        static let newsDetailPageTitle = "News Detail"
        static let viewMoreButton      = "View More..."
    }
}
