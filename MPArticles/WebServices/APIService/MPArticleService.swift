//
//  MPArticleService.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class MPArticleService: WebServiceAPI {
    
    override func requestCompletedWithSuccess(data : Any?) -> Any? {
        
        print(data)
        return nil
    }
    
    override func requestFailed(data : NSError) -> Any?{
        return nil
    }
}
