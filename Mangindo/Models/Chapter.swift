//
//  Chapter.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/21/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class Chapter {
    
    var title: String?
    var number: Int?
    var time: String?
    var comicTitleId: String?
    
    init(title: String, number: Int, time: String, comicTitleId: String) {
        self.title = title
        self.number = number
        self.time = time
        self.comicTitleId = comicTitleId
    }
    
    convenience init(map: [String: Any]) {
        if let title = map["judul"] as! String?,
            let number = map["hidden_chapter"] as! Int?,
            let time = map["waktu"] as! String?,
            let comicTitleId = map["hidden_komik"] as! String? {
            self.init(title: title, number: number, time: time, comicTitleId: comicTitleId)
        } else {
            self.init(title: "", number: 0, time: "", comicTitleId: "")
        }
    }
    
    func getTitle() -> String {
        guard let title = title else {
            return ""
        }
        return title
    }
    
    func getNumber() -> Int {
        guard let number = number else {
            return 0
        }
        return number
    }
    
    func getTime() -> String {
        guard let time = time else {
            return ""
        }
        return time
    }
    
    func getComicTitleId() -> String {
        guard let comicTitleId = comicTitleId else {
            return ""
        }
        return comicTitleId
    }
    
}
