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
        chapters.append(Chapter(title: "Chapter 10 - End of Episode", number: 10, time: "Tue, 10-12-2017", comicTitleId: ""))
        chapters.append(Chapter(title: "Chapter 9 - Episode I", number: 10, time: "Mon, 9-12-2017", comicTitleId: ""))
        chapters.append(Chapter(title: "Chapter 8 - Episode H", number: 10, time: "Sun, 8-12-2017", comicTitleId: ""))
        chapters.append(Chapter(title: "Chapter 7 - Episode G", number: 10, time: "Sat, 7-12-2017", comicTitleId: ""))
        chapters.append(Chapter(title: "Chapter 6 - Episode F", number: 10, time: "Fri, 6-12-2017", comicTitleId: ""))
        chapters.append(Chapter(title: "Chapter 5 - Episode E", number: 10, time: "Thu, 5-12-2017", comicTitleId: ""))
        chapters.append(Chapter(title: "Chapter 4 - Episode D", number: 10, time: "Wed, 4-12-2017", comicTitleId: ""))
        chapters.append(Chapter(title: "Chapter 3 - Episode C", number: 10, time: "Tue, 3-12-2017", comicTitleId: ""))
        chapters.append(Chapter(title: "Chapter 2 - Episode B", number: 10, time: "Mon, 2-12-2017", comicTitleId: ""))
        chapters.append(Chapter(title: "Chapter 1 - Beginning", number: 10, time: "Sun, 1-12-2017", comicTitleId: ""))
        return chapters
    }
    
}
