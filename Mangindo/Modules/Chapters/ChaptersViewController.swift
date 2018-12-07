//
//  ChaptersViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/21/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit

class ChaptersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    fileprivate var reverseButtonItem: UIBarButtonItem?
    fileprivate let chapterCellID = "ChapterViewCell"
    
    var pageTitle = "Chapters"
    var presenter: IChaptersPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = presenter.getDisplayedNavTitle(pageTitle)
        self.reverseButtonItem = UIBarButtonItem(title: presenter.reverseButtonTitle, style: .plain, target: self, action: #selector(reverseButtonTap))
        self.navigationItem.rightBarButtonItem = reverseButtonItem
        tableView.register(UINib(nibName: chapterCellID, bundle: nil), forCellReuseIdentifier: chapterCellID)
        presenter.fetchChapters()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showComicPages" {
            ContentsModule(segue: segue).instantiate(
                pageTitle: "\(pageTitle) \(presenter.selectedChapterNumber)",
                mangaTitleId: presenter.mangaTitleId,
                chapter: presenter.selectedChapterNumber
            )
        }
    }
    
    @objc func reverseButtonTap() {
        presenter.reverseChapters()
    }

}

extension ChaptersViewController: IChaptersView {
    
    func startLoading() {
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        loadingIndicator.startAnimating()
    }
    
    func stopLoading() {
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        loadingIndicator.stopAnimating()
    }
    
    func showData() {
        tableView.reloadData()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Oops", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertActionStyle.default, handler: { _ in
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "Reload", style: UIAlertActionStyle.default, handler: { _ in
            self.presenter.fetchChapters()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateReverseButtonTitle() {
        reverseButtonItem?.title = presenter.reverseButtonTitle
    }
}

extension ChaptersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.chapters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chapterCellID, for: indexPath as IndexPath) as! ChapterViewCell
        cell.mangaChapter = presenter.chapters[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.updateSelectedChapterNumber(index: indexPath.row)
        performSegue(withIdentifier: "showComicPages", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ChapterViewCell
        cell.setHighlighted()
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ChapterViewCell
        cell.setUnhighlighted()
    }

}
