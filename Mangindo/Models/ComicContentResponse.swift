//
//  ComicContentResponse.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import ObjectMapper

class ComicContentResponse: Mappable {
    
    var comicContents: [ComicContent] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        comicContents <- map["chapter"]
    }
    
}

class ComicContent: Mappable {
    
    var imageUrl: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        imageUrl <- map["url"]
    }
    
}
