//
//  File.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/20/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class NewRelease {
    
    var title: String?
    var chapter: String?
    
    init() {
        self.title = ""
        self.chapter = ""
    }
    
    init(title: String, chapter: String) {
        self.title = title
        self.chapter = chapter
    }
    
    var description: String {
        guard let nonNulltitle = title, let nonNullchapter = chapter else {
            return ""
        }
        return "NewRelease= {title=\(nonNulltitle), chapter=\(nonNullchapter)}"
    }
    
}
