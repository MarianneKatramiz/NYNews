//
//  LinksUtils.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import CoreLocation

/// This class was designed and implemented to get links
class LinksUtils: NSObject {
    
    // Api Key NYTimes site
    static let apiKey = "rEURgVi1eAM2wISe9M5wEEefQIEBKU7N"
    
    // Parameter Api Key
    static let paramsApiKey = "api-key"
    
    // The Base URL of the Api calls
    static func getBaseUrl() -> String {
        return "http://api.nytimes.com/"
    }
    
    /// API End Point
    enum Endpoint: String {
        // Popular News Api
        case popularNewsApi = "svc/mostpopular/v2/viewed/"
    }
    
    /// End Point API Call for Popular News
    /// - Parameter days: as String
    static func getPopularNewsApi(for days: Int = 1) -> String {
        let params = "\(LinksUtils.paramsApiKey)=\(LinksUtils.apiKey)"
        let link   = "\(Endpoint.popularNewsApi.rawValue)\(days).json?\(params)"
        
        return link
    }
}
