//
//  ContentZoomableView.swift
//  Mangindo
//
//  Created by Gallant Pratama on 05/12/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

import UIKit

class ContentZoomableView: UIScrollView {
    
    fileprivate var mangaImageView: UIImageView?
    
    var imageUrl: String? = nil {
        didSet {
            if let url = imageUrl, let imageView = mangaImageView {
                imageView.sd_setImage(
                    with: URL(string: url),
                    completed: { (image, _, _, _) -> Void in
                        self.configureSizeAndZoomScale(image)
                    }
                )
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
        self.delegate = self
        self.isUserInteractionEnabled = true
        self.contentMode = .scaleAspectFit
        mangaImageView = UIImageView()
    }
    
    func configureSizeAndZoomScale(_ image: UIImage?) {
        if let image = image, let imageView = mangaImageView {
            imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: image.size)
            self.addSubview(imageView)
            self.contentSize = image.size
            
            let scaleWidth = self.frame.size.width / self.contentSize.width
            let scaleHeight = self.frame.size.height / self.contentSize.height
            let minScale = min(scaleWidth, scaleHeight)
            
            self.minimumZoomScale = minScale
            self.maximumZoomScale = 6.0
            self.zoomScale = minScale
            
            centerScrollViewContents()
        }
    }
    
    func centerScrollViewContents() {
        guard let imageView = mangaImageView else { return }
        let boundsSize = self.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        imageView.frame = contentsFrame
    }
}

extension ContentZoomableView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mangaImageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
       centerScrollViewContents()
    }
}
