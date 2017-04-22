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
        // Initialization code
    }
    
    var chapterNumber: String? {
        didSet {
            if let number = chapterNumber {
                labelChapter.text = "Chapter \(number)"
            }
        }
    }
    
    var chapterTitle: String? {
        didSet {
            if let title = chapterTitle {
                labelTitle.text = title
            }
        }
    }
    
    var comicChapter: Chapter? {
        didSet {
            if let chapter = comicChapter {
                labelChapter.text = chapter.getTitle()
                labelTitle.text = chapter.getTime()
            }
        }
    }
    
}
