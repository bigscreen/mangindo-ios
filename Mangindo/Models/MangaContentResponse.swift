//
//  ComicContentResponse.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import ObjectMapper

class MangaContentResponse: Mappable {
    
    var mangaContents: [MangaContent] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        mangaContents <- map["chapter"]
    }
    
}

class MangaContent: Mappable {
    
    var imageUrl: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        imageUrl <- map["url"]
    }
    
}
