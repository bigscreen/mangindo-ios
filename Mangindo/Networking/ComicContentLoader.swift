//
//  ComicContentsLoader.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class ComicContentLoader {
    
    private var comicTitleId: String?
    private var chapterNumber: Int?
    private var callback: ComicContentProtocol?
    
    init(comicTitleId: String, chapterNumber: Int, callback: ComicContentProtocol) {
        self.comicTitleId = comicTitleId
        self.chapterNumber = chapterNumber
        self.callback = callback
    }
    
    func getComicContents() {
        callback?.startLoading()
        let url = "\(ApiURL.comicContent)?manga=\(comicTitleId!)&chapter=\(chapterNumber!)"
        Alamofire.request(url).responseObject { (response: DataResponse<ComicContentResponse>) in
            self.callback?.stopLoading()
            if response.result.isSuccess, let response = response.result.value {
                self.callback?.onSuccess(comicContents: response.comicContents)
            } else {
                self.callback?.onError(message: response.error?.localizedDescription ?? "Could not fetch data.")
            }
        }
    }
    
}

protocol ComicContentProtocol: class {
    func startLoading()
    func stopLoading()
    func onSuccess(comicContents: [ComicContent])
    func onError(message: String)
}
