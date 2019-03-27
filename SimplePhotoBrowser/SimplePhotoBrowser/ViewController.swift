//
//  ViewController.swift
//  SimplePhotoBrowser
//
//  Created by Ternence on 2019/2/22.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    var imageView:UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.image = UIImage.init(named: "simplePhoto.jpeg")
        
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 5
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

