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
    
    var newReleasedManga: Manga? {
        didSet {
            if let manga = newReleasedManga {
                labelTitle.text = manga.title
                labelChapter.text = "Chapter \(manga.newChapter)"
                imageCover.sd_setImage(with: URL(string: manga.coverUrl))
            }
        }
    }
    
    func initCell() {
        self.layer.cornerRadius = 3
        self.layer.borderWidth = 0.4
        self.layer.borderColor = AppColor.greyDark.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        self.layer.shadowColor = AppColor.greyDark.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.clipsToBounds = false
    }
    
    func setHighlighted() {
        viewCard.backgroundColor = AppColor.greyLight
    }
    
    func setUnhighlighted() {
        viewCard.backgroundColor = UIColor.white
    }

}
