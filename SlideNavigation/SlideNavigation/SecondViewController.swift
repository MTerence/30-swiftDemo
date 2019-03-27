//
//  SecondViewController.swift
//  SlideNavigation
//
//  Created by Ternence on 2019/2/28.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(image: #imageLiteral(resourceName: "SecondViewController"))
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        
        self.navigationController?.navigationBar.isHidden = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
