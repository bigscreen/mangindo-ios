//
//  ApiLoader.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/22/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class NewReleaseLoader {
    
    private var callback: NewReleaseProtocol?
    
    init(callback: NewReleaseProtocol) {
        self.callback = callback
    }
    
    func getNewRelease() {
        callback?.startLoading()
        Alamofire.request(ApiURL.newReleased).responseObject { (response: DataResponse<NewReleasedResponse>) in
            self.callback?.stopLoading()
            if response.result.isSuccess, let response = response.result.value {
                self.callback?.onSuccess(newReleasedComics: response.mangas)
            } else {
                self.callback?.onError(message: response.error?.localizedDescription ?? "Could not fetch data.")
            }
        }
    }
    
}

protocol NewReleaseProtocol: class {
    func startLoading()
    func stopLoading()
    func onSuccess(newReleasedComics: [Manga])
    func onError(message: String)
}
