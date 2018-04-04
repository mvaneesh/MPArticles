//
//  MPArticleType.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class MPArticleType: NSObject {

    func endpoint() -> WebAPIEndpoint{
        
        print(url(path : MOSTPOPULAR_URL))
        return WebAPIEndpoint(method: .get, path: url(path: MOSTPOPULAR_URL), parameters: nil)
    }
    
    private func url(path : String) -> String{
        let pathWithKey = String(format : "%@%@", path, MPARTICLE_API_KEY)
        let completeURL = String(format: "%@%@", baseURL, pathWithKey)
        let resultURL = completeURL.removingPercentEncoding?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        return resultURL!
    }
}
