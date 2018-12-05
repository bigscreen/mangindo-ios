//
//  ChaptersResponse.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import ObjectMapper

class ChaptersResponse: Mappable {
    
    var chapters: [Chapter] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        chapters <- map["komik"]
    }
    
}

class Chapter: Mappable {
    
    var title: String = ""
    var number: Int = 0
    var time: String = ""
    var comicTitleId: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["judul"]
        number <- map["hidden_chapter"]
        time <- map["waktu"]
        comicTitleId <- map["hidden_komik"]
    }
    
}
