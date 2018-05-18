//
//  MPArticleDetailViewController.swift
//  MPArticles
//
//  Created by test on 05/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD

class MPArticleDetailViewController: UIViewController {
    private var articleDetailURL:String = ""
    private var webView = WKWebView()
    
    init(detailURL: String) {
        articleDetailURL = detailURL
        super.init(nibName: nil, bundle: nil)
        
        print("here")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        view = webView
        self.title = ""

        //initialize data
        initializeViewWithData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeViewWithData(){
        if  let url = URL(string: articleDetailURL) {
            webView.load(URLRequest(url: url))
        }
    }
}

//MARK:- webview delegate
extension MPArticleDetailViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        MBProgressHUD.hide(for: view, animated: true)
        title = webView.title
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        MBProgressHUD.hide(for: view, animated: true)
        Utility.showAlert(message: error.localizedDescription, currentView: self)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        MBProgressHUD.hide(for: view, animated: true)
        Utility.showAlert(message: error.localizedDescription, currentView: self)
    }
}
