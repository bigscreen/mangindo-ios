//
//  NetworkService.swift
//  Mangindo
//
//  Created by Gallant Pratama on 26/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

protocol INetworkService {
    func getNewReleased(success: @escaping ObjCallback<[Manga]>, error: @escaping ObjCallback<String>, completion: Callback?)
    func getChapters(mangaTitleId: String, success: @escaping ObjCallback<[Chapter]>, error: @escaping ObjCallback<String>, completion: Callback?)
    func getContents(mangaTitleId: String, chapter: Int, success: @escaping ObjCallback<[Content]>, error: @escaping ObjCallback<String>, completion: Callback?)
}

class NetworkService: INetworkService {
    
    static let shared = NetworkService()
    
    func getNewReleased(success: @escaping ObjCallback<[Manga]>, error: @escaping ObjCallback<String>, completion: Callback? = nil) {
        startRequest(
            ApiURL.newReleased,
            success: { (response: NewReleasedResponse) in
                success(response.mangas)
            },
            error: { errorMessage in
                error(errorMessage)
            },
            completion: {
                completion?()
            }
        )
    }
    
    func getChapters(mangaTitleId: String, success: @escaping ObjCallback<[Chapter]>, error: @escaping ObjCallback<String>, completion: Callback? = nil) {
        let url = "\(ApiURL.chapters)?manga=\(mangaTitleId)"
        startRequest(
            url,
            success: { (response: ChaptersResponse) in
                success(response.chapters)
            },
            error: { errorMessage in
                error(errorMessage)
            },
            completion: {
                completion?()
            }
        )
    }
    
    func getContents(mangaTitleId: String, chapter: Int, success: @escaping ObjCallback<[Content]>, error: @escaping ObjCallback<String>, completion: Callback? = nil) {
        let url = "\(ApiURL.contents)?manga=\(mangaTitleId)&chapter=\(chapter)"
        startRequest(
            url,
            success: { (response: ContentsResponse) in
                success(response.nonAdsContents)
            },
            error: { errorMessage in
                error(errorMessage)
            },
            completion: {
                completion?()
            }
        )
    }
    
    private func startRequest<T: Mappable>(_ url: String, success: @escaping ObjCallback<T>, error: @escaping ObjCallback<String>, completion: @escaping Callback) {
        Logger.debug(tag: "NetworkService", message: "Fetching \(url)")
        Alamofire.request(url).responseObject { (response: DataResponse<T>) in
            Logger.debug(tag: "NetworkService", message: "Fetch completed")
            completion()
            if response.result.isSuccess, let response = response.result.value {
                Logger.debug(tag: "NetworkService", message: "Fetch succeed, response -> \(response.toJSON())")
                success(response)
            } else {
                Logger.error(tag: "NetworkService", message: "Fetch failed, error -> \(String(describing: response.error))")
                error(response.error?.localizedDescription ?? "Could not fetch manga images")
            }
        }
    }
}
