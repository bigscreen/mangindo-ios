//
//  ChaptersContract.swift
//  Mangindo
//
//  Created by Gallant Pratama on 26/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

protocol IChaptersView: BaseView { }

protocol IChaptersPresenter {
    var mangaTitleId: String { get }
    var chapters: [Chapter] { get }
    var selectedChapterNumber: Int { get }
    func fetchChapters()
    func updateSelectedChapterNumber(index: Int)
}
