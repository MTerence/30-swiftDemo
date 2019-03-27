//
//  ViewController.swift
//  Vertical Menu Transition
//
//  Created by Ternence on 2019/2/28.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CustomTransitionDelegate,UIViewControllerTransitioningDelegate {

    var transition = CustomTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: self.view.frame)
        imageView.image = #imageLiteral(resourceName: "Photo10")
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.addSubview(imageView)
        
        let menuButtonBar = UIBarButtonItem(title: "🏀", style: UIBarButtonItem.Style.plain, target: self, action: #selector(triggerMenu))
        self.navigationItem.leftBarButtonItem = menuButtonBar
    }
    
    @objc func triggerMenu(){
        let menuViewController = MenuViewController()
        menuViewController.transitioningDelegate = self
        menuViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        self.navigationController?.present(menuViewController, animated: true, completion: nil)
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.navigationType = .Dismiss
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.delegate = self
        transition.navigationType = .Present
        return transition
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

public enum ViewControllerNavigationType:Int {
    case Present = 0
    case Dismiss = 1
}

