//
//  ChaptersLoader.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class ChaptersLoader {
    
    private var comicTitleId: String?
    private var callback: ChaptersProtocol?
    
    init(comicTitleId: String, callback: ChaptersProtocol) {
        self.comicTitleId = comicTitleId
        self.callback = callback
    }
    
    func getChapters() {
        callback?.startLoading()
        let url = "\(ApiURL.chapters)?manga=\(comicTitleId!)"
        Alamofire.request(url).responseObject { (response: DataResponse<ChaptersResponse>) in
            self.callback?.stopLoading()
            if response.result.isSuccess, let response = response.result.value {
                self.callback?.onSuccess(chapters: response.chapters)
            } else {
                self.callback?.onError(message: response.error?.localizedDescription ?? "Could not fetch data.")
            }
        }
    }
    
}

protocol ChaptersProtocol: class {
    func startLoading()
    func stopLoading()
    func onSuccess(chapters: [Chapter])
    func onError(message: String)
}
