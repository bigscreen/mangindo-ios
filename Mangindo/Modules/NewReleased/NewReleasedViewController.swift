//
//  ViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 2/17/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit
import SDWebImage

class NewReleasedViewController: UIViewController {
    
    @IBOutlet weak var newReleaseCollectionView: UICollectionView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    internal let newReleaseCellID = "NewReleasedViewCell"
    
    var presenter: INewReleasedPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        let emptyImage = UIImage()
        self.navigationController?.navigationBar.shadowImage = emptyImage
        self.navigationController?.navigationBar.setBackgroundImage(emptyImage, for: UIBarMetrics.default)
        newReleaseCollectionView.register(UINib(nibName: newReleaseCellID, bundle: nil), forCellWithReuseIdentifier: newReleaseCellID)
        presenter = NewReleasedPresenter(view: self, service: NetworkService.shared)
        presenter.fetchNewReleased()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChapters" {
            ChaptersModule(segue: segue).instantiate(
                pageTitle: presenter.selectedTitle,
                mangaTitleId: presenter.selectedTitleId
            )
        }
    }
    
}

extension NewReleasedViewController: INewReleasedView {
    
    func startLoading() {
        loadingIndicator.startAnimating()
    }
    
    func stopLoading() {
        loadingIndicator.stopAnimating()
    }
    
    func showData() {
        newReleaseCollectionView.reloadData()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Reload", style: UIAlertActionStyle.default, handler: { action in
            self.presenter.fetchNewReleased()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension NewReleasedViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.mangas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.size.width - 24) / 3;
        let cellHeight = cellWidth * 1.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newReleaseCellID, for: indexPath as IndexPath) as! NewReleasedViewCell
        cell.newReleasedManga = presenter.mangas[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectManga(index: indexPath.item)
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
