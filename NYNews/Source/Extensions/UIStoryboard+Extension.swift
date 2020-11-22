//
//  UIStoryboard+Extension.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

extension UIStoryboard {
   
    enum Storyboard: String {
        case main
        
        var filename: String {
            return rawValue.capitalizedFirstLetter
        }
    }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
    func instantiateViewController<T>(with identifier: String? = nil) -> T where T: StoryboardInstantiable {
        let storyboardID = identifier ?? T.storyboardIdentifier
        guard let viewController = instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(storyboardID)")
        }
        return viewController
    }
}

protocol StoryboardInstantiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInstantiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func create(with identifier: String? = nil) -> Self {
        let storyboardID = identifier ?? storyboardIdentifier
        let storyboard = UIStoryboard(name: storyboardID, bundle: nil)
        return storyboard.instantiateViewController(with: identifier)
    }

    static func create(of storyboard: UIStoryboard.Storyboard) -> Self {
        return UIStoryboard(storyboard: storyboard).instantiateViewController()
    }
}

extension UIViewController: StoryboardInstantiable {}
