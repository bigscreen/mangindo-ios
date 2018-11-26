//
//  ContentsModule.swift
//  Mangindo
//
//  Created by Gallant Pratama on 27/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

import UIKit

class ContentsModule {
    
    private let segue: UIStoryboardSegue
    
    init(segue: UIStoryboardSegue) {
        self.segue = segue
    }
    
    func instantiate(pageTitle: String, mangaTitleId: String, chapter: Int) {
        let controller = segue.destination as! ContentsViewController
        let presenter = ContentsPresenter(view: controller, service: NetworkService.shared, mangaTitleId: mangaTitleId, chapter: chapter)
        controller.pageTitle = pageTitle
        controller.presenter = presenter
    }
}
