//
//  ChaptersModule.swift
//  Mangindo
//
//  Created by Gallant Pratama on 27/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

import Foundation
import UIKit

class ChaptersModule {
    
    private let segue: UIStoryboardSegue
    
    init(segue: UIStoryboardSegue) {
        self.segue = segue
    }
    
    func instantiate(pageTitle: String, mangaTitleId: String) {
        let controller = segue.destination as! ChaptersViewController
        let presenter = ChaptersPresenter(view: controller, service: NetworkService.shared, mangaTitleId: mangaTitleId)
        controller.pageTitle = pageTitle
        controller.presenter = presenter
    }
}
