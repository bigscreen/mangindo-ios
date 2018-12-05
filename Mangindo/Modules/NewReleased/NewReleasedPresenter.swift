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
    private var originalMangas: [Manga] = []
    
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
                self.originalMangas = mangas
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
    
    func search(mangaName: String) {
        let lowercasedName = mangaName.lowercased()
        if lowercasedName.isEmpty {
            mangas = originalMangas
        } else {
            mangas = originalMangas.filter { $0.title.lowercased().contains(lowercasedName) }
        }
        view?.showData()
    }
    
}
