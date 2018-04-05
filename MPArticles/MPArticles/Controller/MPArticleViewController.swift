//
//  MPArticleViewController.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit
import MBProgressHUD

private let ARTICLECELL_IDENTIFIER = "MPArticleTableCellTableViewCell"
private let VIEW_TITLE = "NY Times Most Popular"

class MPArticleViewController: UIViewController {

    @IBOutlet weak var articleTableView: UITableView!
    
    var viewModel = MPArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeViewWithData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeViewWithData(){
        
        // register table cell
        registerTableViewCell()
        
        // setup navigation title
        navigationController?.navigationBar.barTintColor = Utility.colorFromRGB(red: 71.0, green: 227.0, blue: 193.0)
        articleTableView.rowHeight = UITableViewAutomaticDimension;
        title = VIEW_TITLE
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        // call service to get data
        MBProgressHUD.showAdded(to: view, animated: true)
        viewModel.mostPopularArticles(completion: { (success) in
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
                
                if(success != nil && success == true){
                    self.articleTableView.reloadData()
                }
            }
            
        }) { (error) in
            Utility.showAlert(message: error!.localizedDescription, currentView: self)
        }
    }
    
    func registerTableViewCell(){
        articleTableView.register(UINib(nibName: ARTICLECELL_IDENTIFIER, bundle: nil), forCellReuseIdentifier: ARTICLECELL_IDENTIFIER)
    }
}

//MARK- table delegate and data source
extension MPArticleViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.numberofRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let articleCell = articleTableView.dequeueReusableCell(withIdentifier: ARTICLECELL_IDENTIFIER, for: indexPath) as? MPArticleTableCellTableViewCell{
            articleCell.setData(articleInfo: viewModel.articleInfoAt(index: indexPath.row))
            
            return articleCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
}
