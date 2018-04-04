//
//  MPArticleViewController.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import Foundation
import Alamofire

typealias Parameters = [String: Any]

enum Method {
    case get, post
    
    var almofireHttpMethod: Alamofire.HTTPMethod {
            switch self {
            case .get: return .get
            case .post: return .post
            }
        }
}



///Base class for all API service calls, each module service class has to inherit from this calss and need to implement necessary methods.
 class WebServiceAPI {
    
    var headers: HTTPHeaders = ["Content-Type": "application/json"]
    
    ///Web service url request to the server
    func request(_ endpoint: WebAPIEndpoint, success:@escaping (Any?) -> Void, failure:@escaping (Error) -> Void) {
        
     let appURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=3167ba2a4694476cb67d5d5189527701"
        guard let url = URL(string: appURL) else {
            return
        }
       
        Alamofire.request(url,method: .get,parameters: nil).validate().responseJSON {
            response in
            switch response.result {
            case .success:
                print("Response: \(String(describing: response.result.value))")
                let outModel = self.requestCompletedWithSuccess(data: response.result.value)
                success(outModel)
                break
            case .failure(let error):
                failure(error)
            }
        }
    }

    func requestCompletedWithSuccess(data : Any?) -> Any? {
        return nil
    }
    
    func requestFailed(data : NSError) -> Any?{
        return nil
    }
}

