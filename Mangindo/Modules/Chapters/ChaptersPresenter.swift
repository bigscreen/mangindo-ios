//
//  ChaptersPresenter.swift
//  Mangindo
//
//  Created by Gallant Pratama on 26/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

class ChaptersPresenter: IChaptersPresenter {
    
    private weak var view: IChaptersView?
    private let service: INetworkService
    
    let mangaTitleId: String
    var chapters: [Chapter] = []
    var selectedChapterNumber: Int = 0
    var reverseButtonTitle: String = "A→Z"
    
    init(view: IChaptersView, service: INetworkService, mangaTitleId: String) {
        self.view = view
        self.service = service
        self.mangaTitleId = mangaTitleId
    }
    
    func fetchChapters() {
        view?.startLoading()
        service.getChapters(
            mangaTitleId: mangaTitleId,
            success: { chapters in
                self.chapters = chapters
                self.view?.showData()
            },
            error: { message in
                self.view?.showAlert(message: message)
            },
            completion: {
                self.view?.stopLoading()
            }
        )
    }
    
    func updateSelectedChapterNumber(index: Int) {
        selectedChapterNumber = chapters[index].number
    }
    
    func reverseChapters() {
        chapters = chapters.reversed()
        reverseButtonTitle = reverseButtonTitle == "A→Z" ? "Z→A" : "A→Z"
        view?.showData()
        view?.updateReverseButtonTitle()
    }
    
    func getDisplayedNavTitle(_ title: String) -> String {
        if title.count <= 13 {
            return title
        } else {
            return "\(title.prefix(13)).."
        }
    }
}
