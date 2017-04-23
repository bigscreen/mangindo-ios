//
//  ComicContentsLoader.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Alamofire

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
        Alamofire.request(url).responseJSON { response in
            guard response.result.isSuccess else {
                print("Error, \(response.result.error)")
                self.callback?.stopLoading()
                self.callback?.onError(message: "Could not fetch data.")
                return
            }
            guard let responseJSON = response.result.value as? [String: Any] else {
                print("Error, Could not parse data")
                self.callback?.stopLoading()
                self.callback?.onError(message: "Could not fetch data.")
                return
            }
            let comicContentResponse = ComicContentResponse(map: responseJSON)
            self.callback?.stopLoading()
            self.callback?.onSuccess(comicContents: comicContentResponse.getComicContents())
        }
    }
    
}

protocol ComicContentProtocol: class {
    func startLoading()
    func stopLoading()
    func onSuccess(comicContents: [ComicContent])
    func onError(message: String)
}
