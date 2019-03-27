//
//  BubleTransition.swift
//  GoogleNow
//
//  Created by Ternence on 2019/3/6.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

open class BubleTransition: NSObject {

    open var startingPoint = CGPoint.zero{
        didSet{
            buble.center = startingPoint
        }
    }
    
    
    open var duration = 0.5
    
    open var transitionModel:BubbleTransitionModel = .present
    
    open var bubleColor:UIColor = UIColor.white
    
    open fileprivate(set) var buble = UIView()
    
    @objc public enum BubbleTransitionModel:Int{
        case present, dismiss, pop
    }
    
    var animationBlock:((_ transitionModel:BubbleTransitionModel) -> ())?
}

extension BubleTransition: UIViewControllerAnimatedTransitioning{
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        if transitionModel == .present {
            let presentedControllerView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
            let originalCenter = presentedControllerView.center
            let originalSize = presentedControllerView.frame.size
            
            buble = UIView()
            buble.frame = frameForBubble(originalCenter, size: originalSize, start: startingPoint)
            buble.layer.cornerRadius = buble.frame.size.height / 2
            buble.center = startingPoint
            buble.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            buble.backgroundColor = bubleColor
            container.addSubview(buble)
            
            presentedControllerView.center = startingPoint
            presentedControllerView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            presentedControllerView.alpha = 0
            container.addSubview(presentedControllerView)
            
            UIView.animate(withDuration: duration, animations: {
                
                self.buble.transform = CGAffineTransform.identity
                presentedControllerView.transform = CGAffineTransform.identity
                presentedControllerView.alpha = 1
                presentedControllerView.center = originalCenter
                
                if self.animationBlock != nil {
                    self.animationBlock!(self.transitionModel)
                }
            }) { (_) in
                transitionContext.completeTransition(true)
                self.buble.isHidden = true
                fromViewController?.endAppearanceTransition()
                toViewController?.endAppearanceTransition()
            }
        }else{
            
            let key = (transitionModel == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            let returningControllerView = transitionContext.view(forKey: key)!
            let originalCenter = returningControllerView.center
            let originalSize = returningControllerView.frame.size
            
            buble.frame = frameForBubble(originalCenter, size: originalSize, start: startingPoint)
            buble.layer.cornerRadius = buble.frame.size.height / 2
            buble.center = startingPoint
            buble.isHidden = false
            
            
            
            UIView.animate(withDuration: duration, animations: {
                self.buble.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                returningControllerView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                returningControllerView.center = self.startingPoint
                returningControllerView.alpha = 0
                
                if self.transitionModel == .pop {
                    container.insertSubview(returningControllerView, belowSubview: returningControllerView)
                    container.insertSubview(self.buble, belowSubview: returningControllerView)
                }
                
                if self.animationBlock != nil {
                    self.animationBlock!(self.transitionModel)
                }
            }) { (_) in
                
                returningControllerView.center = originalCenter
                returningControllerView.removeFromSuperview()
                self.buble.removeFromSuperview()
                transitionContext.completeTransition(true)
                
                fromViewController?.endAppearanceTransition()
                toViewController?.endAppearanceTransition()
            }
            
            
            
            
        }
        
        
        
    }
}

private extension BubleTransition {
    func frameForBubble(_ originalCenter: CGPoint, size originalSize:CGSize, start:CGPoint) -> CGRect {
        let lengthX = fmax(start.x, originalSize.width - start.x)
        let lengthY = fmax(start.y, originalSize.height - start.y)
        let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2
        let size = CGSize(width: offset, height: offset)
        
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
}
