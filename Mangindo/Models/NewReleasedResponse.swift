//
//  NewReleasedResponse.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/22/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class NewReleasedResponse {
    
    var comics: [Comic]?
    
    init(map: [String: Any]) {
        if let comicsMap = map["komik"] as! [[String: Any]]? {
            comics = []
            comicsMap.forEach { comicMap in
                comics?.append(Comic(map: comicMap))
            }
        }
    }
    
    func getComics() -> [Comic] {
        guard let comics = comics else {
            return []
        }
        return comics
    }
    
}
