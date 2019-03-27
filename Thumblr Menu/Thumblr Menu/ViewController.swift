//
//  ViewController.swift
//  Thumblr Menu
//
//  Created by Ternence on 2019/2/26.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var blurView:UIVisualEffectView!
    var alphaBtn:UIButton!
    var quoteBtn:UIButton!
    var chatBtn:UIButton!
    var photoBtn:UIButton!
    var linkBtn:UIButton!
    var audioBtn:UIButton!
    var dumpingRate:CGFloat = 0.8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgImagerView = UIImageView(frame: self.view.frame)
        bgImagerView.image = #imageLiteral(resourceName: "LaunchImage-800")
        self.view.addSubview(bgImagerView)
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.view.addGestureRecognizer(tapGes)
    }
    
    @objc func tapAction() {
        self.setupFunctions()
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(removeBlur))
        blurView.addGestureRecognizer(tapGes)
        blurView.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 10, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
            self.alphaBtn.frame.origin.x = 60
            self.photoBtn.frame.origin.x = 192
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 10, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
            self.quoteBtn.frame.origin.x = 60
            self.linkBtn.frame.origin.x = 192
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 10, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
            self.chatBtn.frame.origin.x = 60
            self.audioBtn.frame.origin.x = 192
        }, completion: nil)
        
    }
    
    func setupFunctions() {
        let blurEffect:UIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)
        
        alphaBtn = UIButton(frame: CGRect(x: -88, y: 80, width: 88, height: 88))
        alphaBtn.setImageAndTitle(imageName: "Text", title: "Message", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(alphaBtn)
        
        quoteBtn = UIButton(frame: CGRect(x: -88, y: 246, width: 88, height: 88))
        quoteBtn.setImageAndTitle(imageName: "Quote", title: "Quote", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(quoteBtn)
        
        chatBtn = UIButton(frame: CGRect(x: -88, y: 406, width: 88, height: 88))
        chatBtn.setImageAndTitle(imageName: "Chat", title: "Chat", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(chatBtn)
        
        photoBtn = UIButton(frame: CGRect(x: self.view.frame.width + 88, y: 88, width: 88, height: 88))
        photoBtn.setImageAndTitle(imageName: "Photo", title: "Photo", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(photoBtn)
        
        linkBtn = UIButton(frame: CGRect(x: self.view.frame.width + 88, y: 246, width: 88, height: 88))
        linkBtn.setImageAndTitle(imageName: "Link", title: "Link", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(linkBtn)
        
        audioBtn = UIButton(frame: CGRect(x: self.view.frame.width + 88, y: 406, width: 88, height: 88))
        audioBtn.setImageAndTitle(imageName: "Audio", title: "Audio", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(audioBtn)
    }
    
    @objc func removeBlur() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 1, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
            self.blurView.alpha = 0
            self.alphaBtn.frame.origin.x = -88
            self.quoteBtn.frame.origin.x = -88
            self.chatBtn.frame.origin.x = -88
            
            self.linkBtn.frame.origin.x = self.view.frame.width + 88
            self.photoBtn.frame.origin.x = self.view.frame.width + 88
            self.audioBtn.frame.origin.x = self.view.frame.width + 88
        }) { (isFinished) in
            self.blurView.removeFromSuperview()
            self.alphaBtn.removeFromSuperview()
            self.quoteBtn.removeFromSuperview()
            self.chatBtn.removeFromSuperview()
            self.photoBtn.removeFromSuperview()
            self.linkBtn.removeFromSuperview()
            self.audioBtn.removeFromSuperview()
        }
    }


}

