//
//  ContentsViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 8/30/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit
import iCarousel

class ContentsViewController: UIViewController {
    
    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var pageTitle = "Manga Content"
    var presenter: IContentsPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = pageTitle
        
        carousel.delegate = self
        carousel.dataSource = self
        carousel.isPagingEnabled = true
        carousel.bounces = false
        carousel.isScrollEnabled = true
        
        presenter.fetchContents()
    }

}

extension ContentsViewController: IContentsView {
    
    func startLoading() {
        loadingIndicator.startAnimating()
    }
    
    func stopLoading() {
        loadingIndicator.stopAnimating()
    }
    
    func showData() {
        carousel.reloadData()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Reload", style: UIAlertActionStyle.default, handler: { action in
            self.presenter.fetchContents()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ContentsViewController: iCarouselDelegate, iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return presenter.contents.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let pageRect = CGRect(x: 0, y: 0, width: carousel.frame.width, height: carousel.frame.height)
        let imageUrl = presenter.contents[index].imageUrl
        let pageView = ContentView(frame: pageRect, imageUrl: imageUrl, pageNumber: index)
        return pageView
    }
}
