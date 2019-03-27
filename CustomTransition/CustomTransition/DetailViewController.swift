//
//  DetailViewController.swift
//  CustomTransition
//
//  Created by Ternence on 2019/2/28.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UINavigationControllerDelegate {

    var bannerImageView:UIImageView!
    var image:UIImage!
    
    let RothkoDescription = "Mark Rothko (/ˈrɒθkoʊ/), born Markus Yakovlevich Rothkowitz (Russian: Ма́ркус Я́ковлевич Ротко́вич, Latvian: Markuss Rotkovičs; September 25, 1903 – February 25, 1970), was an American painter of Russian Jewish descent. Although Rothko himself refused to adhere to any art movement, he is generally identified as an abstract expressionist. With Jackson Pollock and Willem de Kooning, he is one of the most famous postwar American artists."
    
    fileprivate var percentDrivenTransition:UIPercentDrivenInteractiveTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerImageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 400, height: 400))
        bannerImageView.center.x = self.view.center.x
        self.view.addSubview(bannerImageView)
        
        let textView = UITextView(frame: CGRect(x: 0, y: 500, width: self.view.frame.size.width, height: self.view.frame.size.height - 500))
        textView.text = RothkoDescription
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = UIColor.black
        textView.textColor = UIColor.white
        self.view.addSubview(textView)
        
        self.navigationController?.delegate = self
        
        let edgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgePanGestrueAction(_:)))
        edgePanGesture.edges = UIRectEdge.left
        self.view.addGestureRecognizer(edgePanGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationController.Operation.pop {
            return CustomPopTransition()
        }
        else {
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is CustomPopTransition {
            return self.percentDrivenTransition
        }
        else {
            return nil
        }
    }
    
    @objc func edgePanGestrueAction(_ edgePan:UIScreenEdgePanGestureRecognizer) {
        let progress = edgePan.translation(in: self.view).x / self.view.bounds.width
        
        if edgePan.state == UIGestureRecognizer.State.began {
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewController(animated: true)
        }
        else if edgePan.state == UIGestureRecognizer.State.changed {
            self.percentDrivenTransition?.update(progress)
        }
        
        else if edgePan.state == UIGestureRecognizer.State.cancelled || edgePan.state == UIGestureRecognizer.State.ended {
            if progress > 0.5  {
                self.percentDrivenTransition?.finish()
            } else {
                self.percentDrivenTransition?.cancel()
            }
            self.percentDrivenTransition = nil
        }
        
    }
    
    
}
