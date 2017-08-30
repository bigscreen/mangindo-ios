//
//  ComicContentViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/23/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit

class ComicContentViewController: UIPageViewController, ComicContentProtocol, UIPageViewControllerDataSource {
    
    var comicContents: [ComicContent] = []
    
    var loader: ComicContentLoader?
    
    var pageTitle = "Manga Content"
    var comicTitleId = ""
    var comicChapterNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = pageTitle
        self.dataSource = self
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
        self.setViewControllers( [getViewControllerAt(index: 0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    
    func onError(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Reload", style: UIAlertActionStyle.default, handler: { action in
            self.loader?.getComicContents()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return comicContents.count
    }
    
    func getViewControllerAt(index: Int) -> ContentPageViewController {
        let viewController = ContentPageViewController(nibName: "ContentPageViewController", bundle: nil)
        viewController.imageUrl = comicContents[index].imageUrl
        viewController.pageIndex = index
        return viewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent = viewController as! ContentPageViewController
        var index = pageContent.pageIndex!
        if index == NSNotFound {
            return nil;
        }
        index += 1;
        if index == comicContents.count {
            return nil;
        }
        return getViewControllerAt(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent = viewController as! ContentPageViewController
        var index = pageContent.pageIndex!
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index -= 1;
        return getViewControllerAt(index: index)
    }

}
