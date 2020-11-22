//
//  CoreNetworking.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

typealias CompletionHandler = ((_ success: Bool, _ response: String, _ message: String) -> Void)

/// This class was designed and implemented for Networking
class CoreNetworking {
    
    static let apiTimeout = 60

    /// HTTP Method
    enum HTTPMethod: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
}
