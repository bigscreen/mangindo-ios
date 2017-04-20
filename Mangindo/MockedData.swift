//
//  MockedData.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/20/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class MockedData {
    
    static func getNewReleases() -> [NewRelease] {
        var newReleases: [NewRelease] = []
        newReleases.append(NewRelease(title: "Bleach", chapter: "65"))
        newReleases.append(NewRelease(title: "Naruto", chapter: "98"))
        newReleases.append(NewRelease(title: "One Piece", chapter: "125"))
        newReleases.append(NewRelease(title: "Dr Stone", chapter: "7"))
        newReleases.append(NewRelease(title: "One Punch Man", chapter: "12"))
        newReleases.append(NewRelease(title: "Air Gear", chapter: "42"))
        newReleases.append(NewRelease(title: "Shokugeki No Souma", chapter: "37"))
        newReleases.append(NewRelease(title: "Gintama", chapter: "81"))
        newReleases.append(NewRelease(title: "Tokyo Ghoul", chapter: "6"))
        newReleases.append(NewRelease(title: "Fairy Tail", chapter: "59"))
        newReleases.append(NewRelease(title: "Mob Psycho", chapter: "100"))
        newReleases.append(NewRelease(title: "Freezing", chapter: "22"))
        return newReleases
    }
    
}
