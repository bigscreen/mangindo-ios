//
//  ViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 2/17/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var newReleaseCollectionView: UICollectionView!
    
    let reuseIdentifier = "newReleaseCell" // also enter this string as the cell identifier in the storyboard
    
    var chaptersu = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    var newReleases: [NewRelease] = MockedData.getNewReleases()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // set width of collection view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collViewWidth = newReleaseCollectionView.frame.size.width
        let cellWidth = (collViewWidth / 3) - 6;
        let cellHeight = cellWidth * 1.5
        return CGSize(width: cellWidth, height: cellHeight)
        
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newReleases.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! NewReleasedCollectionViewCell
        
        let newRelease = newReleases[indexPath.item]
        cell.labelTitle.text = newRelease.title!
        cell.labelChapter.text = "Chapter \(newRelease.chapter!)"
        
        cell.backgroundColor = UIColor.green // make cell more visible in our example project
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NewReleasedCollectionViewCell
        cell.labelTitle.textColor = UIColor.white
        cell.labelChapter.textColor = UIColor.white
        cell.backgroundColor = UIColor.darkGray
    }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NewReleasedCollectionViewCell
        cell.labelTitle.textColor = UIColor.black
        cell.labelChapter.textColor = UIColor.black
        cell.backgroundColor = UIColor.green
    }


}

