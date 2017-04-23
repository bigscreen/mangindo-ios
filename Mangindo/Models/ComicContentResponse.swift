//
//  ComicContentResponse.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class ComicContentResponse {
    
    var comicContents: [ComicContent]?
    
    init(map: [String: Any]) {
        if let comicContentsMap = map["chapter"] as! [[String: Any]]? {
            comicContents = []
            comicContentsMap.forEach { comicContentMap in
                comicContents?.append(ComicContent(map: comicContentMap))
            }
        }
    }
    
    func getComicContents() -> [ComicContent] {
        guard let comicContents = comicContents else {
            return []
        }
        return comicContents
    }
    
}
