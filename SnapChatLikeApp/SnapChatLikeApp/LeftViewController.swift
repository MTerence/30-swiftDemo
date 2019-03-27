//
//  LeftViewController.swift
//  SnapChatLikeApp
//
//  Created by Ternence on 2019/3/5.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: self.view.frame)
        imageView.image = #imageLiteral(resourceName: "leftSnap")
        self.view.addSubview(imageView)
        
    }

}
