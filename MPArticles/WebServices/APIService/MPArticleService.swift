//
//  MPArticleService.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class MPArticleService: WebServiceAPI {
    
    //handle success response
    override func requestCompletedWithSuccess(responseData : Any?) -> Any? {
        
        var mpArticles: [MPArticleModel] = []
        if let response = responseData as? [String: AnyObject] {
            if let resultsData = response["results"] as? NSArray{
                
                for result in resultsData{
                    if let dictResult = result as? NSDictionary{
                        mpArticles.append(parseArticleData(dataDict: dictResult))
                    }
                }
            }
            
            return mpArticles
        }
        return nil
    }
    
    //handle failure response
    override func requestFailed(error : NSError) -> Any?{
        return error
    }
    
    //parse data and create model
    private func parseArticleData(dataDict: NSDictionary) -> MPArticleModel{
        var articleInfo = MPArticleModel()
        
        if let title = dataDict["title"] as? String{
            articleInfo.title = title
        }
        if let url = dataDict["url"] as? String{
            articleInfo.detailURL = url
        }
        if let date = dataDict["published_date"] as? String{
            articleInfo.publishDate = date
        }
        if let byLine = dataDict["byline"] as? String{
            articleInfo.byLine = byLine
        }
        
        return articleInfo
        
    }
}
