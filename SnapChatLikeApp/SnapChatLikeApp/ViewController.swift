//
//  ViewController.swift
//  SnapChatLikeApp
//
//  Created by Ternence on 2019/3/5.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(scrollView)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentOffset = CGPoint(x: self.view.frame.width, y: 0)
        
        let leftViewController = LeftViewController()
        let centerViewController = CenterViewController()
        let rightViewController = RightViewController()
        
        self.addChild(leftViewController)
        scrollView.addSubview(leftViewController.view)
        leftViewController.view.frame.origin.x = 0
        
        self.addChild(centerViewController)
        scrollView.addSubview(centerViewController.view)
        centerViewController.view.frame.origin.x = self.view.frame.width
        
        self.addChild(rightViewController)
        scrollView.addSubview(rightViewController.view)
        rightViewController.view.frame.origin.x = self.view.frame.size.width * 2
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
    }


}

