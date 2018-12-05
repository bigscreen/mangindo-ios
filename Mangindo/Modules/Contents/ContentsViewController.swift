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
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertActionStyle.default, handler: { _ in
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "Reload", style: UIAlertActionStyle.default, handler: { _ in
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
        let pageView = ContentZoomableView(frame: CGRect(x: 0, y: 0, width: carousel.frame.width, height: carousel.frame.height))
        pageView.imageUrl = presenter.contents[index].imageUrl
        return pageView
    }
}
