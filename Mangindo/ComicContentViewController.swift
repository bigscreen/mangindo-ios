//
//  ComicContentViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit

class ComicContentViewController: UIPageViewController, ComicContentProtocol {
    
    var comicContents: [ComicContent] = []
    
    var loader: ComicContentLoader?
    
    var pageTitle = "Manga Content"
    var comicTitleId = ""
    var comicChapterNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = pageTitle
        loader = ComicContentLoader(comicTitleId: comicTitleId, chapterNumber: comicChapterNumber, callback: self as ComicContentProtocol)
        loader?.getComicContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func onSuccess(comicContents: [ComicContent]) {
        self.comicContents = comicContents
        print("ulala \(comicContents)")
    }
    
    func onError(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Reload", style: UIAlertActionStyle.default, handler: { action in
            self.loader?.getComicContents()
        }))
        self.present(alert, animated: true, completion: nil)
    }


}
