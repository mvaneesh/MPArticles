//
//  MPArticleViewModel.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class MPArticleViewModel: NSObject {
    
    var popularArticles: [MPArticleModel] = []
    
    //call to server to get the data
    func mostPopularArticles(completion: @escaping (_ success: Bool?) ->Void, fail: @escaping (_ fail: Error?)-> Void ){
        
        let service = MPArticleService()
        service.request(MPArticleType().endpoint(), success: { (data) in
            
            if let articleData = data as? [MPArticleModel]{
                self.popularArticles = articleData
                completion(true)
            }
            
        }) { (error) in
            fail(error)
        }
    }
    
    //update UI methods
    func numberofRows()->Int{
        return popularArticles.count
    }
    
    func articleInfoAt(index: Int)-> MPArticleModel{
        return popularArticles[index]
    }
    
    
}
