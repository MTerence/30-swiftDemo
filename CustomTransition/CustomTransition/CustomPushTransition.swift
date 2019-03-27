//
//  CustomPushTransition.swift
//  CustomTransition
//
//  Created by Ternence on 2019/3/1.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class CustomPushTransition: NSObject,UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! DetailViewController
        
        let container = transitionContext.containerView
        
        let snapshotView = fromVC.selectedCell.imageView.snapshotView(afterScreenUpdates: false)
        snapshotView?.frame = container.convert(fromVC.selectedCell.imageView.frame, from: fromVC.selectedCell)
        fromVC.selectedCell.imageView.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.view.alpha = 0
        
        container.addSubview(toVC.view)
        container.addSubview(snapshotView!)
        toVC.bannerImageView.layoutIfNeeded()
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            snapshotView?.frame = toVC.bannerImageView.frame
            fromVC.view.alpha = 0
            toVC.view.alpha = 1
        }) { (finish) in
            snapshotView?.frame = toVC.bannerImageView.frame
            fromVC.selectedCell.imageView.isHidden = false
            toVC.bannerImageView.image = toVC.image
            snapshotView?.removeFromSuperview()
            
            transitionContext.completeTransition(true)
        }
        
    }
}
