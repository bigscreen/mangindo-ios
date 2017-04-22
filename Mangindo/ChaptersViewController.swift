//
//  ChaptersViewController.swift
//  Mangindo
//
//  Created by Gallant Pratama on 4/21/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit

class ChaptersViewController: UIViewController, ChaptersProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    let chapterCellID = "ChapterViewCell"
    var chapters: [Chapter] = []
    
    var loader: ChaptersLoader?
    
    var pageTitle = "Chapters"
    var comicTitleId = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = pageTitle
        setupTableView()
        loader = ChaptersLoader(comicTitleId: comicTitleId, callback: self as ChaptersProtocol)
        loader?.getChapters()
    }

    func setupTableView() {
        tableView.register(UINib(nibName: "ChapterViewCell", bundle: nil), forCellReuseIdentifier: "ChapterViewCell")
    }
    
    func onSuccess(chapters: [Chapter]) {
        self.chapters = chapters
        tableView.reloadData()
    }
    
    func onError(message: String) {
        
    }

}

extension ChaptersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chapters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chapterCellID, for: indexPath as IndexPath) as! ChapterViewCell
        cell.backgroundColor = UIColor.white
        cell.selectionStyle = .none
        
        cell.comicChapter = chapters[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: chapterCellID, for: indexPath as IndexPath) as! ChapterViewCell
        cell.backgroundColor = AppColor.greyLight
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: chapterCellID, for: indexPath as IndexPath) as! ChapterViewCell
        cell.backgroundColor = UIColor.white
    }

}
