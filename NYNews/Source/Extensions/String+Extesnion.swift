//
//  String+Extension.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

extension String {
    
    /// Capitalized First Letter
    var capitalizedFirstLetter: String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    /// Adding Percent
    func addingPercentEncoding() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    }
}
