//
//  ChaptersContract.swift
//  Mangindo
//
//  Created by Gallant Pratama on 26/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

protocol IChaptersView: BaseView {
    func updateReverseButtonTitle()
}

protocol IChaptersPresenter {
    var mangaTitleId: String { get }
    var chapters: [Chapter] { get }
    var selectedChapterNumber: Int { get }
    var reverseButtonTitle: String { get }
    func fetchChapters()
    func updateSelectedChapterNumber(index: Int)
    func reverseChapters()
    func getDisplayedNavTitle(_ title: String) -> String
}
