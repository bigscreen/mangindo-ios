//
//  ChapterViewCell.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/21/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit

class ChapterViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var labelChapter: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initCell()
    }
    
    var mangaChapter: Chapter? {
        didSet {
            if let chapter = mangaChapter {
                let titleStringArray = chapter.title.components(separatedBy: " - ")
                if titleStringArray.count == 2 {
                    labelChapter.text = titleStringArray[0]
                    labelTitle.text = titleStringArray[1]
                } else {
                    labelChapter.text = "Chapter \(chapter.number)"
                    labelTitle.text = chapter.title
                }
            }
        }
    }
    
    private func initCell() {
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
    }
    
    func setHighlighted() {
        viewCell.backgroundColor = AppColor.greyLight
    }
    
    func setUnhighlighted() {
        viewCell.backgroundColor = UIColor.white
    }
    
}
