//
//  ChaptersLoader.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Alamofire

class ChaptersLoader {
    
    private var comicTitleId: String?
    private var callback: ChaptersProtocol?
    
    init(comicTitleId: String, callback: ChaptersProtocol) {
        self.comicTitleId = comicTitleId
        self.callback = callback
    }
    
    func getChapters() {
        let url = "\(ApiURL.chapters)?manga=\(comicTitleId!)"
        Alamofire.request(url).responseJSON { response in
            guard response.result.isSuccess else {
                print("Error, \(response.result.error)")
                self.callback?.onError(message: "Error fething data \(response.result.error).")
                return
            }
            guard let responseJSON = response.result.value as? [String: Any] else {
                print("Error, Could not parse data")
                self.callback?.onError(message: "Error fething data.")
                return
            }
            let chapterResponse = ChaptersResponse(map: responseJSON)
            self.callback?.onSuccess(chapters: chapterResponse.getChapters())
        }
    }
    
}

protocol ChaptersProtocol: class {
    func onSuccess(chapters: [Chapter])
    func onError(message: String)
}
