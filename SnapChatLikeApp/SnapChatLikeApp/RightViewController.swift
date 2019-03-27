//
//  RightViewController.swift
//  SnapChatLikeApp
//
//  Created by Ternence on 2019/3/5.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rightImage = UIImageView(frame: self.view.frame)
        rightImage.image = #imageLiteral(resourceName: "rightSnap")
        self.view.addSubview(rightImage)
    }

}
