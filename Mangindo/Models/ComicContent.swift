//
//  ComicContent.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class ComicContent {
    
    var imageUrl: String?
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    convenience init(map: [String: Any]) {
        if let imageUrl = map["url"] as! String? {
            self.init(imageUrl: imageUrl)
        } else {
            self.init(imageUrl: "")
        }
    }
    
    func getImageUrl() -> String {
        guard let imageUrl = imageUrl else {
            return ""
        }
        return imageUrl
    }
    
}
