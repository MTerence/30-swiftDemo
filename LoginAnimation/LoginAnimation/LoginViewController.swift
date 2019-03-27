//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by Ternence on 2019/2/26.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 25/255.0, green: 153/255.0, blue: 3/255.0, alpha: 1)
        self.view.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let usernameTextField = UITextField(frame: CGRect(x: -270, y: 50, width: 270, height: 40))
        usernameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        usernameTextField.placeholder = "username"
        self.view.addSubview(usernameTextField)
        
        let passwordTextField = UITextField(frame: CGRect(x: -270, y: 100, width: 270, height: 40))
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.placeholder = "password"
        self.view.addSubview(passwordTextField)
        
        let loginButton = UIButton(frame: CGRect(x: -125, y: 150, width: 125, height: 40))
        loginButton.setTitle("Login", for: UIControl.State.normal)
        loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginButton.backgroundColor = UIColor(red: 22/255.0, green: 139/255.0, blue: 3/255.0, alpha: 1)
        self.view.addSubview(loginButton)
        
        UIView.animate(withDuration: 0.5) {
            self.view.alpha = 1
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
            usernameTextField.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.8, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            passwordTextField.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            loginButton.center.x = self.view.center.x
        }, completion: nil)

    }

}
