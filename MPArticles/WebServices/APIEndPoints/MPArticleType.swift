//
//  MPArticleType.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class MPArticleType: NSObject {

    // end point for ,ost popular api
    func endpoint() -> WebAPIEndpoint{
        return WebAPIEndpoint(method: .get, path: url(path: MOSTPOPULAR_URL), parameters: nil)
    }
    
    
    // form the url for most popular API
    private func url(path : String) -> String{
        let pathWithKey = String(format : "%@%@", path, MPARTICLE_API_KEY)
        return String(format: "%@%@", baseURL, pathWithKey)
    }
}
