//
//  MPArticleService.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class MPArticleService: WebServiceAPI {
    
    override func requestCompletedWithSuccess(responseData : Any?) -> Any? {
        
        var mpArticles: [MPArticleModel] = []
        if let response = responseData as? [String: AnyObject] {
            if let resultData = response["results"] as? NSDictionary{
                //mpArticles.append(parseArticleData(dataDict: resultData),])
                
            }
        }
        return nil
    }
    
    override func requestFailed(error : NSError) -> Any?{
        return nil
    }
    
    private func parseArticleData(dataDict: NSDictionary) -> MPArticleModel{
        let articleInfo = MPArticleModel()
        
        return articleInfo
        
    }
}
