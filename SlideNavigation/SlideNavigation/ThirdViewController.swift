//
//  ThirdViewController.swift
//  SlideNavigation
//
//  Created by Ternence on 2019/2/28.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(image: #imageLiteral(resourceName: "ThirdViewController"))
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        
        self.navigationController?.navigationBar.isHidden = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

}
