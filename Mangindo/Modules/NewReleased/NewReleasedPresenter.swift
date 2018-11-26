//
//  NewReleasedPresenter.swift
//  Mangindo
//
//  Created by Gallant Pratama on 27/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

class NewReleasedPresenter: INewReleasedPresenter {
    
    private weak var view: INewReleasedView?
    private let service: INetworkService
    
    var mangas: [Manga] = []
    var selectedTitle: String = ""
    var selectedTitleId: String = ""
    
    init(view: INewReleasedView, service: INetworkService) {
        self.view = view
        self.service = service
    }
    
    func fetchNewReleased() {
        view?.startLoading()
        service.getNewReleased(
            success: { mangas in
                self.mangas = mangas
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
    
    func selectManga(index: Int) {
        selectedTitle = mangas[index].title
        selectedTitleId = mangas[index].titleId
    }
    
}
