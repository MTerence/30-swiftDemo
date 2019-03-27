//
//  AnotherViewController.swift
//  GoogleNow
//
//  Created by Ternence on 2019/3/6.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {

    var dismissButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        
        dismissButton = UIButton(type: UIButton.ButtonType.custom)
        dismissButton.frame.size = CGSize(width: 70, height: 70)
        dismissButton.center.x = self.view.center.x
        dismissButton.frame.origin.y = self.view.frame.height - 250
        dismissButton.backgroundColor = UIColor.red
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: UIControl.Event.touchUpInside)
        dismissButton.layer.cornerRadius = dismissButton.frame.width / 2
        dismissButton.layer.masksToBounds = true
        dismissButton.layer.shadowColor = UIColor.black.cgColor
        dismissButton.setImage(#imageLiteral(resourceName: "loading"), for: UIControl.State.normal)
        self.view.addSubview(dismissButton)
        
        let leftBottomImageView = UIImageView(image: #imageLiteral(resourceName: "close"))
        leftBottomImageView.frame.size = CGSize(width: 25, height: 25)
        leftBottomImageView.frame.origin = CGPoint(x: 22, y: self.view.frame.height - 25 - 22)
        self.view.addSubview(leftBottomImageView)
        
        let rightBottomImageView = UIImageView(image: #imageLiteral(resourceName: "window"))
        rightBottomImageView.frame.size = CGSize(width: 25, height: 25)
        rightBottomImageView.frame.origin = CGPoint(x: self.view.frame.width - 22 - 25, y: self.view.frame.height - 25 - 22)
        self.view.addSubview(rightBottomImageView)
        
        let resultLabel = UILabel()
        resultLabel.frame.origin = CGPoint(x: 35, y: 35)
        resultLabel.text = "Speak Now"
        resultLabel.font = UIFont.systemFont(ofSize: 28)
        resultLabel.textColor = UIColor(red: 150/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1)
        self.view.addSubview(resultLabel)
        resultLabel.sizeToFit()
        
        
    }
    
    
    @objc func dismissButtonAction (){
        self.dismiss(animated: true, completion: nil)
    }
}
