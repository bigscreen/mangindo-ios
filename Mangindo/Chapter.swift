//
//  Chapter.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/21/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class Chapter {
    
    var number: String?
    var title: String?
    
    init() {
        self.number = ""
        self.title = ""
    }
    
    init(number: String, title: String) {
        self.number = number
        self.title = title
    }
    
    var description: String {
        guard let number = number, let title = title else {
            return ""
        }
        return "Chapter= {number=\(number), title=\(title)}"
    }
    
}
