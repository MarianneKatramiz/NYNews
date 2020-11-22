//
//  ApiManager.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import Alamofire

// This class is used for all API calls that might be needed for this app
class ApiManager: NSObject {
    
    // This is the "shared" instance of this class that is created only once
    static let shared = ApiManager()
    
    // The Alamofire Manager instance to perform all the API calls
    private var Manager: Alamofire.SessionManager!
    
    private override init() {
        super.init()
       
        Manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default
        )
    }
        
    func apiCall(link: String,
                 method: CoreNetworking.HTTPMethod = .GET,
                 completion: @escaping CompletionHandler) {
        
        // Check inernet connection
        if !appDelegate.applicationCoordinator.reachabilityManager.isConnected() {
            MessagesBuilder.shared.showMessage(title: Constants.Strings.no_internet, messageType: .error)
            completion(false, "", "")
            return
        }
        
        // Set the URL
        let link = "\(LinksUtils.getBaseUrl())\(link)"
        guard let urlString = link.addingPercentEncoding(),
            let url: URL = URL(string: urlString) else {
            completion(false, "", "")
            return
        }
              
        // Request
        var request = URLRequest.init(url: url)
        request.timeoutInterval = TimeInterval(CoreNetworking.apiTimeout)
        request.httpMethod      = method.rawValue
        request.cachePolicy     = NSURLRequest.CachePolicy.reloadIgnoringCacheData
       
        // Make the API Call
        Manager.request(request).responseJSON { response in
            DispatchQueue.main.async(execute: {
                switch response.result {
                case .success:
                    if let data = response.data {
                        let responseString = String(data: data, encoding: .utf8)
                        completion(true, responseString ?? "", "")
                    } else {
                        completion(false, "", response.error?.localizedDescription ?? "")
                    }
                case .failure(let error):
                    completion(false, "", error.localizedDescription)
                }
            })
        }
    }
}
