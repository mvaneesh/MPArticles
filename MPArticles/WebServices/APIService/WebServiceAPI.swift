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

    ///Web service url request to the server
    func request(_ endpoint: WebAPIEndpoint, success:@escaping (Any?) -> Void, failure:@escaping (Error) -> Void) {
        
        Alamofire.request(endpoint.path, method: endpoint.method.almofireHttpMethod, parameters: endpoint.parameters).responseJSON {
            response in
            
            switch response.result {
                
            case .success:
                
                let outModel = self.requestCompletedWithSuccess(responseData: response.result.value)
                success(outModel)
                break
            case .failure(let error):
                failure(error)
            }
        }
    }

    func requestCompletedWithSuccess(responseData : Any?) -> Any? {
        return nil
    }
    
    func requestFailed(error : NSError) -> Any?{
        return nil
    }
}

