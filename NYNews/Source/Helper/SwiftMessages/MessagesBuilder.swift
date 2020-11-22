//
//  MessagesBuilder.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import SwiftMessages

/// This class was designed and implemented to show message builder
class MessagesBuilder: NSObject {
    
    // This is the "shared" instance of this class that is created only once
    static let shared = MessagesBuilder()
    
    /// init
    private override init() {
        super.init()
    }
    
    /// Message Type
    enum MessageType {
        case success
        case error
        case other
    }
    
    /// Show Message
    func showMessage(title: String, body: String = "", messageType: MessageType = .success) {
           
        let insideView = MessageView.viewFromNib(layout: .cardView)
        switch messageType {
        case .success:
            insideView.configureTheme(.success)
       
        case .error:
            insideView.configureTheme(.error)

        case .other:
            let backgroundColor = UIColor.blackColor
            let foregroundColor = UIColor.whiteColor

            insideView.configureTheme(backgroundColor: backgroundColor, foregroundColor: foregroundColor)
        }
        
        insideView.configureDropShadow()
        insideView.button?.isHidden = true
        (insideView.backgroundView as? CornerRoundingView)?.cornerRadius = 10

        // Title
        insideView.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        insideView.titleLabel?.numberOfLines = 0
       
        // Body
        insideView.bodyLabel?.font = UIFont.systemFont(ofSize: 20)
        insideView.bodyLabel?.numberOfLines = 0

        // Set message
        insideView.configureContent(title: title, body: body)
        
        // Show message
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: config, view: insideView)
    }
}
