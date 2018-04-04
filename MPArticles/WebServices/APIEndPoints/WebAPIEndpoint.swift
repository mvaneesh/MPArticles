//
//  WebAPIEndpoint.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

//Base end point for api
final class WebAPIEndpoint {
    
    let method: Method
    let path: String
    let parameters: Parameters?
    
    init(method: Method = .get,
         path: String,
         parameters: Parameters? = nil) {
        self.method = method
        self.path = path
        self.parameters = parameters
    }
}

