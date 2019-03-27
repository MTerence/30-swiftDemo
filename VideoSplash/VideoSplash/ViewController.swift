//
//  ViewController.swift
//  VideoSplash
//
//  Created by Ternence on 2019/2/25.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    let buttonHeight:CGFloat = 56
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 50, width: 334, height: 101))
        logoImageView.image = #imageLiteral(resourceName: "logo.png")
        logoImageView.center.x = self.view.center.x
        self.view.addSubview(logoImageView)
        
        let loginButton = UIButton(frame: CGRect(x: 0, y: (self.view.frame.size.height - buttonHeight), width: self.view.frame.size.width / 2, height: buttonHeight))
        loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginButton.setTitle("LOG IN", for: UIControl.State.normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
        self.view.addSubview(loginButton)
        
        let singupButton = UIButton(frame: CGRect(x: self.view.frame.width/2.0, y: (self.view.frame.height - buttonHeight), width: self.view.frame.width/2.0, height: buttonHeight))
        singupButton.setTitle("SING UP", for: UIControl.State.normal)
        singupButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        singupButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        singupButton.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        self.view.addSubview(singupButton)
    }
    
    func setupVideoBackground() {
        let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillModel = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 0.0
        alpha = 0.8
        
        contentURL = url as NSURL
        view.isUserInteractionEnabled = false
    }
}

