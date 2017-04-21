//
//  ChapterBigViewCell.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/21/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit

class ChapterBigViewCell: UITableViewCell {
    
    @IBOutlet weak var labelChapter: UILabel!

    var chapterName: String? {
        didSet {
            if let name = chapterName {
                labelChapter.text = name
            }
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
