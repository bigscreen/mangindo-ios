//
//  ViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 2/17/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, NewReleaseProtocol {
    
    @IBOutlet weak var newReleaseCollectionView: UICollectionView!
    
    let newReleaseCellID = "NewReleasedViewCell"
    var newReleasedComics: [Comic] = []
    
    var loader: NewReleaseLoader?
    
    var selectedTitle = ""
    var selectedTitleId = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
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
            let controller = segue.destination as! ChaptersViewController
            controller.pageTitle = selectedTitle
            controller.comicTitleId = selectedTitleId
        }
    }
    
    func onSuccess(newReleasedComics: [Comic]) {
        self.newReleasedComics = newReleasedComics
        newReleaseCollectionView.reloadData()
    }
    
    func onError(message: String) {
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // set width of collection view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collViewWidth = newReleaseCollectionView.frame.size.width
        let cellWidth = collViewWidth / 3;
        let cellHeight = cellWidth * 1.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newReleasedComics.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newReleaseCellID, for: indexPath as IndexPath) as! NewReleasedViewCell
        cell.newReleasedComic = newReleasedComics[indexPath.item]
        return cell
    }
    
    // handle tap events
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let comic = newReleasedComics[indexPath.item]
        selectedTitle = comic.getTitle()
        selectedTitleId = comic.getTitleId()
        self.performSegue(withIdentifier: "showChapters", sender: self)
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NewReleasedViewCell
        cell.setHighlighted()
    }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NewReleasedViewCell
        cell.backgroundColor = UIColor.white
        cell.setUnhighlighted()
    }
}
