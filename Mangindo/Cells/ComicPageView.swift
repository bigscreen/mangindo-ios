//
//  ComicPageView.swift
//  Mangindo
//
//  Created by Gallant Pratama on 8/30/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation
import UIKit

class ComicPageView: UIView {
    
    private var comicImageView: UIImageView!
    private var pageNumberLabel: UILabel!
    
    private var imageUrl: String?
    private var pageNumber: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    init(frame: CGRect, imageUrl: String, pageNumber: Int) {
        super.init(frame: frame)
        self.imageUrl = imageUrl
        self.pageNumber = pageNumber
        setupViews()
        setupContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        comicImageView = UIImageView()
        comicImageView.translatesAutoresizingMaskIntoConstraints = false
        comicImageView.contentMode = .scaleAspectFit
        pageNumberLabel = UILabel()
        pageNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        pageNumberLabel.textColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 0.8)
        pageNumberLabel.font = pageNumberLabel.font.withSize(11)
        pageNumberLabel.textAlignment = .center
        pageNumberLabel.backgroundColor = UIColor.white
        pageNumberLabel.layer.cornerRadius = 9
        pageNumberLabel.layer.masksToBounds = true
        setupConstraints()
    }
    
    private func setupConstraints() {
        let comicImageViewDict: [String: UIImageView] = ["comicImage": comicImageView]
        let pageNumberLabelDict: [String: UILabel] = ["pageLabel": pageNumberLabel]
        
        self.addSubview(comicImageView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[comicImage]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: comicImageViewDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[comicImage]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: comicImageViewDict))
        
        self.addSubview(pageNumberLabel)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[pageLabel(18)]-12-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: pageNumberLabelDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[pageLabel(18)]-16-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: pageNumberLabelDict))
    }
    
    private func setupContents() {
        if let url = imageUrl {
            comicImageView.sd_setImage(with: URL(string: url))
        }
        if let page = pageNumber {
            pageNumberLabel.text = "\(page + 1)"
        }
    }
    
    func setImageUrl(imageUrl: String) {
        self.imageUrl = imageUrl
        setupContents()
    }
    
    func setPageNumber(pageNumber: Int) {
        self.pageNumber = pageNumber
        setupContents()
    }

}
