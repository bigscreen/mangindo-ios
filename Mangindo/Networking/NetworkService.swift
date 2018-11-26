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
    func getNewReleased(success: @escaping ObjCallback<[Manga]>, error: @escaping ObjCallback<String>)
    func getChapters(mangaTitleId: String, success: @escaping ObjCallback<[Chapter]>, error: @escaping ObjCallback<String>, completion: Callback?)
    func getContents(mangaTitleId: String, chapter: Int, success: @escaping ObjCallback<[Content]>, error: @escaping ObjCallback<String>, completion: Callback?)
}

class NetworkService: INetworkService {
    
    static let shared = NetworkService()
    
    func getNewReleased(success: @escaping ObjCallback<[Manga]>, error: @escaping ObjCallback<String>) {
        Alamofire.request(ApiURL.newReleased).responseObject { (response: DataResponse<NewReleasedResponse>) in
            if response.result.isSuccess, let response = response.result.value {
                success(response.mangas)
            } else {
                error(response.error?.localizedDescription ?? "Could not fetch mangas")
            }
        }
    }
    
    func getChapters(mangaTitleId: String, success: @escaping ObjCallback<[Chapter]>, error: @escaping ObjCallback<String>, completion: Callback? = nil) {
        let url = "\(ApiURL.chapters)?manga=\(mangaTitleId)"
        Alamofire.request(url).responseObject { (response: DataResponse<ChaptersResponse>) in
            completion?()
            if response.result.isSuccess, let response = response.result.value {
                success(response.chapters)
            } else {
                error(response.error?.localizedDescription ?? "Could not fetch chapters")
            }
        }
    }
    
    func getContents(mangaTitleId: String, chapter: Int, success: @escaping ObjCallback<[Content]>, error: @escaping ObjCallback<String>, completion: Callback? = nil) {
        let url = "\(ApiURL.contents)?manga=\(mangaTitleId)&chapter=\(chapter)"
        Alamofire.request(url).responseObject { (response: DataResponse<ContentsResponse>) in
            completion?()
            if response.result.isSuccess, let response = response.result.value {
                success(response.contents)
            } else {
                error(response.error?.localizedDescription ?? "Could not fetch manga images")
            }
        }
    }
}
