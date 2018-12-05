//
//  ContentsResponse.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import ObjectMapper

class ContentsResponse: Mappable {
    
    var contents: [Content] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        contents <- map["chapter"]
    }
    
}

class Content: Mappable {
    
    var imageUrl: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        imageUrl <- map["url"]
    }
    
}
