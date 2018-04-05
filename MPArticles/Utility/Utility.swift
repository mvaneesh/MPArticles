//
//  Utility.swift
//  MPArticles
//
//  Created by test on 05/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class Utility: NSObject {

    class func showAlert(message: String, currentView : UIViewController){
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
        
        }))
        currentView.present(alertController, animated: true, completion: nil)
    }
    
    class func colorFromRGB(red: CGFloat, green: CGFloat, blue: CGFloat) ->UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
}
