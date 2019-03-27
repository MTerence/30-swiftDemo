//
//  ViewController.swift
//  LoginAnimation
//
//  Created by Ternence on 2019/2/26.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let buttonHeight:CGFloat = 56
        
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(red: 25/255.0, green: 153/255.0, blue: 3/255.0, alpha: 1)
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 50, width: 334, height: 101))
        logoImageView.image = #imageLiteral(resourceName: "logo.png")
        logoImageView.center.x = self.view.center.x
        self.view.addSubview(logoImageView)
        
        let loginButton = UIButton(frame: CGRect(x: 0, y: self.view.frame.height - buttonHeight, width: self.view.frame.width/2, height: buttonHeight))
        loginButton.setTitle("Login", for: UIControl.State.normal)
        loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
//        loginButton.addTarget(self, action: #selector(onLoginBtnClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(onLoginBtnClick), for: UIControl.Event.touchUpInside)
        
        let sinupButton = UIButton(frame: CGRect(x: self.view.frame.width / 2, y: self.view.frame.height - buttonHeight, width: self.view.frame.width/2, height: buttonHeight))
        sinupButton.setTitle("Sinup", for: UIControl.State.normal)
        sinupButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        sinupButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sinupButton.backgroundColor = UIColor(red: 42/255.0, green: 193/255.0, blue: 90/255.0, alpha: 1)
        self.view.addSubview(sinupButton)
    }
    
    @objc func onLoginBtnClick (){
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }


}

