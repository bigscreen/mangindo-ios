//
//  ChapterViewCell.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/21/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit

class ChapterViewCell: UITableViewCell {
    
    @IBOutlet weak var labelChapter: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var comicChapter: Chapter? {
        didSet {
            if let chapter = comicChapter {
                let titleStringArray = chapter.getTitle().components(separatedBy: " - ")
                if titleStringArray.count == 2 {
                    labelChapter.text = titleStringArray[0]
                    labelTitle.text = titleStringArray[1]
                } else {
                    labelChapter.text = "Chapter \(chapter.getNumber())"
                    labelTitle.text = chapter.getTitle()
                }
            }
        }
    }
    
}
