//
//  ViewController.swift
//  SlideNavigation
//
//  Created by Ternence on 2019/2/28.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: #imageLiteral(resourceName: "ViewController"))
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

