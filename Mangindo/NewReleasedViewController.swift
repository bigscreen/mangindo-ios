//
//  ViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 2/17/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit
import SDWebImage

class NewReleasedViewController: UIViewController, NewReleaseProtocol {
    
    @IBOutlet weak var newReleaseCollectionView: UICollectionView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    let newReleaseCellID = "NewReleasedViewCell"
    var newReleasedComics: [Manga] = []
    
    var loader: NewReleaseLoader?
    
    var selectedTitle = ""
    var selectedTitleId = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let emptyImage = UIImage()
        self.navigationController?.navigationBar.shadowImage = emptyImage
        self.navigationController?.navigationBar.setBackgroundImage(emptyImage, for: UIBarMetrics.default)
        setupCollectionView()
        loader = NewReleaseLoader(callback: self as NewReleaseProtocol)
        loader?.getNewRelease()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupCollectionView() {
        newReleaseCollectionView.register(UINib(nibName: "NewReleasedViewCell", bundle: nil), forCellWithReuseIdentifier: newReleaseCellID)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChapters" {
            ChaptersModule(segue: segue).instantiate(pageTitle: selectedTitle, mangaTitleId: selectedTitleId)
        }
    }
    
    func startLoading() {
        loadingIndicator.startAnimating()
    }
    
    func stopLoading() {
        loadingIndicator.stopAnimating()
    }
    
    func onSuccess(newReleasedComics: [Manga]) {
        self.newReleasedComics = newReleasedComics
        newReleaseCollectionView.reloadData()
    }
    
    func onError(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Reload", style: UIAlertActionStyle.default, handler: { action in
            self.loader?.getNewRelease()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension NewReleasedViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newReleasedComics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.size.width - 24) / 3;
        let cellHeight = cellWidth * 1.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newReleaseCellID, for: indexPath as IndexPath) as! NewReleasedViewCell
        cell.newReleasedManga = newReleasedComics[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let comic = newReleasedComics[indexPath.item]
        selectedTitle = comic.title
        selectedTitleId = comic.titleId
        self.performSegue(withIdentifier: "showChapters", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NewReleasedViewCell
        cell.setHighlighted()
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NewReleasedViewCell
        cell.backgroundColor = UIColor.white
        cell.setUnhighlighted()
    }
}
