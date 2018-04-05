//
//  MPArticleTableCellTableViewCell.swift
//  MPArticles
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class MPArticleTableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var publishDate: UILabel!
    @IBOutlet weak var articleBy: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(articleInfo: MPArticleModel){
        title.text = articleInfo.title
        articleBy.text = articleInfo.byLine
        publishDate.text = articleInfo.publishDate
    }
    
}
