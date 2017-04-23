//
//  ContentPageViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit
import SDWebImage

class ContentPageViewController: UIViewController {

    @IBOutlet weak var imageComic: UIImageView!
    @IBOutlet weak var labelPageNumber: UILabel!
    
    var pageIndex: Int?
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = imageUrl {
            imageComic.contentMode = UIViewContentMode.scaleAspectFit
            imageComic.sd_setImage(with: URL(string: url))
        }
        if let page = pageIndex {
            labelPageNumber.text = "\(page + 1)"
        }
    }

}
