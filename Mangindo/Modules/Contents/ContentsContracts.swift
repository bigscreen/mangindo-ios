//
//  ContentsContracts.swift
//  Mangindo
//
//  Created by Gallant Pratama on 27/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

protocol IContentsView: BaseView { }

protocol IContentsPresenter {
    var contents: [Content] { get }
    func fetchContents()
    func getDisplayedNavTitle(_ title: String) -> String
}
