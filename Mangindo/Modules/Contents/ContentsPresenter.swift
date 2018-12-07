//
//  ContentsPresenter.swift
//  Mangindo
//
//  Created by Gallant Pratama on 27/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

class ContentsPresenter: IContentsPresenter {
    
    private weak var view: IContentsView?
    private let service: INetworkService
    private let mangaTitleId: String
    private let chapter: Int
    
    var contents: [Content] = []
    
    init(view: IContentsView, service: INetworkService, mangaTitleId: String, chapter: Int) {
        self.view = view
        self.service = service
        self.mangaTitleId = mangaTitleId
        self.chapter = chapter
    }
    
    func fetchContents() {
        view?.startLoading()
        service.getContents(
            mangaTitleId: mangaTitleId,
            chapter: chapter,
            success: { contents in
                self.contents = contents
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
    
    func getDisplayedNavTitle(_ title: String) -> String {
        if title.count <= 20 {
            return title
        } else {
            return "\(title.prefix(20))..."
        }
    }
}
