//
//  NewReleasedViewCell.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/21/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit
import SDWebImage

class NewReleasedViewCell: UICollectionViewCell {

    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var labelChapter: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initCell()
    }
    
    var newReleasedComic: Comic? {
        didSet {
            if let comic = newReleasedComic {
                labelTitle.text = comic.getTitle()
                labelChapter.text = "Chapter \(comic.getNewChapter())"
                imageCover.sd_setImage(with: URL(string: comic.getCoverUrl()))
            }
        }
    }
    
    func initCell() {
        viewCard.layer.cornerRadius = 3
        viewCard.layer.borderWidth = 0.4
        viewCard.layer.borderColor = AppColor.greyDark.cgColor
        viewCard.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        viewCard.layer.shadowColor = AppColor.greyDark.cgColor
        viewCard.layer.shadowRadius = 1.5
        viewCard.layer.shadowOpacity = 0.5
        viewCard.layer.masksToBounds = false
        viewCard.clipsToBounds = false
    }
    
    func setHighlighted() {
        viewCard.backgroundColor = AppColor.greyLight
    }
    
    func setUnhighlighted() {
        viewCard.backgroundColor = UIColor.white
    }

}