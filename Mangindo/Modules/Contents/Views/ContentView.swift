//
//  ContentView.swift
//  Mangindo
//
//  Created by Gallant Pratama on 8/30/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import UIKit

class ContentView: UIView {
    
    fileprivate var mangaImageView: UIImageView? = nil {
        didSet {
            if let imageView = mangaImageView {
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.contentMode = .scaleAspectFit
                let mangaImageViewDict: [String: UIImageView] = ["mangaImage": imageView]
                self.addSubview(imageView)
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mangaImage]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: mangaImageViewDict))
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mangaImage]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: mangaImageViewDict))
            }
        }
    }
    
    fileprivate var pageNumberLabel: UILabel? = nil {
        didSet {
            if let label = pageNumberLabel {
                label.translatesAutoresizingMaskIntoConstraints = false
                label.textColor = UIColor(red: 47, green: 47, blue: 47)
                label.font = label.font.withSize(12)
                label.textAlignment = .center
                label.backgroundColor = UIColor.white
                label.layer.cornerRadius = 9
                label.layer.masksToBounds = true
                let pageNumberLabelDict: [String: UILabel] = ["pageLabel": label]
                self.addSubview(label)
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[pageLabel(18)]-12-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: pageNumberLabelDict))
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[pageLabel(18)]-16-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: pageNumberLabelDict))
            }
        }
    }
    
    var imageUrl: String? = nil {
        didSet {
            if let url = imageUrl, let imageView = mangaImageView {
                imageView.sd_setImage(with: URL(string: url))
            }
        }
    }
    
    var pageNumber: Int? = nil {
        didSet {
            if let number = pageNumber, let label = pageNumberLabel {
                label.text = "\(number)"
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        mangaImageView = UIImageView()
        pageNumberLabel = UILabel()
    }
    
}
