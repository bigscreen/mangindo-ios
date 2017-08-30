//
//  ComicPagesViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 8/30/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit
import iCarousel

class ComicPagesViewController: UIViewController {
    
    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var comicContents: [ComicContent] = []
    
    var loader: ComicContentLoader?
    
    var pageTitle = "Manga Content"
    var comicTitleId = ""
    var comicChapterNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = pageTitle
        
        carousel.delegate = self
        carousel.dataSource = self
        carousel.isPagingEnabled = true
        carousel.bounces = false
        carousel.isScrollEnabled = true
        
        loader = ComicContentLoader(comicTitleId: comicTitleId, chapterNumber: comicChapterNumber, callback: self as ComicContentProtocol)
        loader?.getComicContents()
    }

}

extension ComicPagesViewController: ComicContentProtocol {
    
    func startLoading() {
        loadingIndicator.startAnimating()
    }
    
    func stopLoading() {
        loadingIndicator.stopAnimating()
    }
    
    func onSuccess(comicContents: [ComicContent]) {
        self.comicContents = comicContents
        carousel.reloadData()
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

extension ComicPagesViewController: iCarouselDelegate, iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return comicContents.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let pageRect = CGRect(x: 0, y: 0, width: carousel.frame.width, height: carousel.frame.height)
        let imageUrl = comicContents[index].imageUrl
        let pageView = ComicPageView(frame: pageRect, imageUrl: imageUrl, pageNumber: index)
        return pageView
    }
}
