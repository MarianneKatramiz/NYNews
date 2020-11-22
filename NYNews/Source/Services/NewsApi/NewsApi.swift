//
//  NewsApi.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

class NewsApi: NSObject {

    // This is the "shared" instance of this class that is created only once
    static let shared = NewsApi()
    
    private override init() {
        super.init()
    }
    
    /// get news
    func getNews(days: Int = 1, completion: @escaping (_ success: Bool, _ data: [NewsDetailModel]?, _ message: String) -> Void) {
                
        ApiManager.shared.apiCall(link: LinksUtils.getPopularNewsApi(for: days)) { (success, response, message) in
            if success {
                parseCodable(responseString: response, type: NewsModel.self, successHandler: { (result) in
                    let array = result.results ?? []
                    if array.count == 0 { // Error
                        completion(false, [], "")
                    } else { // Success
                        completion(true, array, "")
                    }
                }) { (error) in // Error
                    completion(false, [], error)
                }
            } else { // Error
                completion(false, [], message)
            }
        }
    }
}
