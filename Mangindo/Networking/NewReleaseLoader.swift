//
//  ApiLoader.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/22/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Alamofire

class NewReleaseLoader {
    
    private var callback: NewReleaseProtocol?
    
    init(callback: NewReleaseProtocol) {
        self.callback = callback
    }
    
    func getNewRelease() {
        Alamofire.request(ApiURL.newReleased).responseJSON { response in
            guard response.result.isSuccess else {
                print("Error, \(response.result.error)")
                self.callback?.onError(message: "Error fethind data \(response.result.error).")
                return
            }
            guard let responseJSON = response.result.value as? [String: Any] else {
                print("Error, Could not parse data")
                self.callback?.onError(message: "Error fethind data.")
                return
            }
            let newReleased = NewReleasedResponse(map: responseJSON)
            self.callback?.onSuccess(newReleasedComics: newReleased.getComics())
        }
    }
    
}

protocol NewReleaseProtocol: class {
    func onSuccess(newReleasedComics: [Comic])
    func onError(message: String)
}
