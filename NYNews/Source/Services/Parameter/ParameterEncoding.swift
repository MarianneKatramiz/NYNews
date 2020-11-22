//
//  DecodeCodable.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

/// This method/function was designed & implemented to: Parse a data response and convert it to a Codable struct
///
/// - Parameters:
///   - data: Response data as NSData
///   - type: Codable struct
///   - successHandler: Parsing success closure
///   - errorHandler: Parsing error closure
func parseCodable <T: Codable>(responseString: String?, type: T.Type, successHandler: @escaping (_ details: T) -> Void, errorHandler: @escaping (_ error: String) -> Void) {
    
    guard let responseData = responseString?.data(using: .utf8) else {
        errorHandler("")
        return
    }
    
    do {
        _ = try JSONDecoder().decode(T.self, from: responseData)
    } catch let jsonErr {
        errorHandler("Parsing error, please contact support\nDetails:\n(\(jsonErr))")
        return
    }
    guard let decodedJson = try? JSONDecoder().decode(T.self, from: responseData) else {
        errorHandler("")
        return
    }
    successHandler(decodedJson)
}
