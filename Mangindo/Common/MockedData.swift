//
//  MockedData.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/20/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation

class MockedData {
    
    static func getNewReleasedComics() -> [Comic] {
        var newReleasedComics: [Comic] = []
        newReleasedComics.append(Comic(title: "Bleach", titleId: "bleach", coverUrl: "", newChapter: "65", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "Naruto", titleId: "naruto", coverUrl: "", newChapter: "98", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "One Piece", titleId: "one_piece", coverUrl: "", newChapter: "125", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "Dr Stone", titleId: "dr_stone", coverUrl: "", newChapter: "7", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "One Punch Man", titleId: "one_punch", coverUrl: "", newChapter: "12", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "Air Gear", titleId: "air_gear", coverUrl: "", newChapter: "42", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "Shokugeki No Souma", titleId: "sn_sou", coverUrl: "", newChapter: "37", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "Gintama", titleId: "gintama", coverUrl: "", newChapter: "81", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "Tokyo Ghoul", titleId: "tokyo_ghoul", coverUrl: "", newChapter: "6", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "Fairy Tail", titleId: "fairy_tail", coverUrl: "", newChapter: "59", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "Mob Psycho", titleId: "mob_psycho", coverUrl: "", newChapter: "100", lastModifiedDate: ""))
        newReleasedComics.append(Comic(title: "Freezing", titleId: "freezing", coverUrl: "", newChapter: "22", lastModifiedDate: ""))
        return newReleasedComics
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
