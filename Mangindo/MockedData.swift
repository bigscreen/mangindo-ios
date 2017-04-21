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
    
    static func getChapters() -> [Chapter] {
        var chapters: [Chapter] = []
        chapters.append(Chapter(number: "10", title: "End of Episode"))
        chapters.append(Chapter(number: "9", title: "Episode I"))
        chapters.append(Chapter(number: "8", title: "Episode H"))
        chapters.append(Chapter(number: "7", title: "Episode G"))
        chapters.append(Chapter(number: "6", title: "Episode F"))
        chapters.append(Chapter(number: "5", title: "Episode E"))
        chapters.append(Chapter(number: "4", title: "Episode D"))
        chapters.append(Chapter(number: "3", title: "Episode C"))
        chapters.append(Chapter(number: "2", title: "Episode B"))
        chapters.append(Chapter(number: "1", title: "Beginning"))
        return chapters
    }
    
}
