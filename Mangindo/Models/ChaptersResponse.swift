//
//  ChaptersResponse.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class ChaptersResponse {
    
    var chapters: [Chapter]?
    
    init(map: [String: Any]) {
        if let chaptersMap = map["komik"] as? [[String: Any]] {
            chapters = []
            chaptersMap.forEach { chapterMap in
                chapters?.append(Chapter(map: chapterMap))
            }
        }
    }
    
    func getChapters() -> [Chapter] {
        guard let chapters = chapters else {
            return []
        }
        return chapters
    }
    
}
