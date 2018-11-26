//
//  NewReleasedResponse.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/22/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import ObjectMapper

class NewReleasedResponse: Mappable {
    
    var mangas: [Manga] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        mangas <- map["komik"]
    }
    
}

class Manga: Mappable {
    
    var title: String = ""
    var titleId: String = ""
    var coverUrl: String = ""
    var newChapter: String = ""
    var lastModifiedDate: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["judul"]
        titleId <- map["hidden_komik"]
        coverUrl <- map["icon_komik"]
        newChapter <- map["hiddenNewChapter"]
        lastModifiedDate <- map["lastModified"]
    }
    
}
