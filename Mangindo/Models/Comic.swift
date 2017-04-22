//
//  Manga.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/22/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class Comic {
    
    var title: String?
    var titleId: String?
    var coverUrl: String?
    var newChapter: String?
    var lastModifiedDate: String?
    
    init(title: String, titleId: String, coverUrl: String, newChapter: String, lastModifiedDate: String) {
        self.title = title
        self.titleId = titleId
        self.coverUrl = coverUrl
        self.newChapter = newChapter
        self.lastModifiedDate = lastModifiedDate
    }
    
    convenience init(map: [String: Any]) {
        if let title = map["judul"] as! String?,
            let titleId = map["hidden_komik"] as! String?,
            let coverUrl = map["icon_komik"] as! String?,
            let newChapter = map["hiddenNewChapter"] as! String?,
            let lastModifiedDate = map["lastModified"] as! String? {
            self.init(title: title, titleId: titleId, coverUrl: coverUrl, newChapter: newChapter, lastModifiedDate: lastModifiedDate)
        } else {
            self.init(title: "", titleId: "", coverUrl: "", newChapter: "", lastModifiedDate: "")
        }
    }
    
    func getTitle() -> String {
        guard let title = title else {
            return ""
        }
        return title
    }
    
    func getTitleId() -> String {
        guard let titleId = titleId else {
            return ""
        }
        return titleId
    }
    
    func getCoverUrl() -> String {
        guard let coverUrl = coverUrl else {
            return ""
        }
        return coverUrl
    }
    
    func getNewChapter() -> String {
        guard let newChapter = newChapter else {
            return ""
        }
        return newChapter
    }
    
    func getLastModifiedDate() -> String {
        guard let lastModifiedDate = lastModifiedDate else {
            return ""
        }
        return lastModifiedDate
    }
    
}
