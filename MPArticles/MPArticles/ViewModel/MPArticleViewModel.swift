//
//  MPArticleViewModel.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class MPArticleViewModel: NSObject {
    
    func mostPopularArticles(completion: (_ data: MPArticleModel?) ->Void){
        
        let service = MPArticleService()
        service.request(MPArticleType().endpoint(), success: { (data) in
            
        }) { (error) in
            
            
        }
    }
    
    
}
