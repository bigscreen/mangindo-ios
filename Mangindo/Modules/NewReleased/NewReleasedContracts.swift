//
//  NewReleasedContracts.swift
//  Mangindo
//
//  Created by Gallant Pratama on 27/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

protocol INewReleasedView: BaseView { }

protocol INewReleasedPresenter {
    var mangas: [Manga] { get }
    var selectedTitle: String { get }
    var selectedTitleId: String { get }
    func fetchNewReleased()
    func selectManga(index: Int)
}
