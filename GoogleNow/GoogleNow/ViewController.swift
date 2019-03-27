//
//  ViewController.swift
//  GoogleNow
//
//  Created by Ternence on 2019/3/6.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {

    let transition = BubleTransition()
    var triggerButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        self.navigationController?.navigationBar.isHidden = true
        
        let leftImgView = UIImageView(frame: CGRect(x: 22, y: 22, width: 25, height: 25))
        leftImgView.image = #imageLiteral(resourceName: "setting")
        self.view.addSubview(leftImgView)
        
        let rightImageView = UIImageView(frame: CGRect(x: self.view.frame.width - 25 - 22, y: 22, width: 25, height: 22))
        rightImageView.image = #imageLiteral(resourceName: "window")
        self.view.addSubview(rightImageView)
        
        let signinLabel = UILabel()
        signinLabel.text = "SIGN IN"
        signinLabel.frame.origin.y = 22
        signinLabel.textColor = UIColor(red: 150/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1)
        signinLabel.font = UIFont.systemFont(ofSize: 20)
        signinLabel.sizeToFit()
        self.view.addSubview(signinLabel)
        signinLabel.center.x = self.view.center.x
        
        let logoImageView = UIImageView()
        logoImageView.frame.size = CGSize(width: 170, height: 71)
        logoImageView.image = #imageLiteral(resourceName: "google_logo")
        logoImageView.center.x = self.view.center.x
        logoImageView.center.y = self.view.center.y - 50 - 71
        self.view.addSubview(logoImageView)
        
        
        let textField = UITextField()
        textField.frame.size = CGSize(width: self.view.frame.width - 60, height:50)
        textField.center.x = self.view.center.x
        textField.center.y = self.view.center.y - 20
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderColor = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1).cgColor
        textField.backgroundColor = UIColor.white
        textField.layer.borderWidth = 1.0
        self.view.addSubview(textField)
        
        
        triggerButton = UIButton(type: UIButton.ButtonType.custom)
        triggerButton.frame.size = CGSize(width: 70, height: 70)
        triggerButton.center.x = self.view.center.x
        triggerButton.frame.origin.y = textField.frame.maxY + 40
        triggerButton.backgroundColor = UIColor.white
        triggerButton.addTarget(self, action: #selector(triggerButtonAction), for: UIControl.Event.touchUpInside)
        triggerButton.layer.cornerRadius = triggerButton.frame.width / 2
        triggerButton.layer.masksToBounds = true
        triggerButton.layer.shadowColor = UIColor.black.cgColor
        triggerButton.setImage(#imageLiteral(resourceName: "speaking"), for: UIControl.State.normal)
        self.view.addSubview(triggerButton)
    }

    
    @objc func triggerButtonAction(){
        let anotherVC = AnotherViewController()
        anotherVC.transitioningDelegate = self
        anotherVC.modalPresentationStyle = UIModalPresentationStyle.custom
        self.navigationController?.present(anotherVC, animated: true, completion: nil)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionModel = .dismiss
        transition.startingPoint = triggerButton.center
        transition.bubleColor = triggerButton.backgroundColor!
        transition.animationBlock = {(transitionModel) -> Void in
            if transitionModel == .dismiss {
                let dismissedVC = dismissed as! AnotherViewController
                dismissedVC.dismissButton.frame.origin.y = self.view.frame.height - 250
                
            }
        }
        
        transition.duration = 5
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionModel = .present
        transition.startingPoint = triggerButton.center
        transition.bubleColor = UIColor.white
        transition.animationBlock = {(transitionModel) -> Void in
            if transitionModel == .present {
                let targetVC = presented as! AnotherViewController
                targetVC.dismissButton.frame.origin.y = self.view.frame.height - 150
                
            }
        }
        
        transition.duration = 5
        return transition
    }
    
    

}

