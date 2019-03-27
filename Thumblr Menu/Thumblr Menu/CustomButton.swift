//
//  CustomButton.swift
//  Thumblr Menu
//
//  Created by Ternence on 2019/2/26.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

enum ButtonImagePosition:Int {
    case PositionTop = 0
    case PositionLeft
    case PositionBottom
    case PositionRight
}

extension UIButton {
    func setImageAndTitle(imageName:String, title:String, type:ButtonImagePosition, space:CGFloat) {
        self.setTitle(title, for: UIControl.State.normal)
        self.setImage(UIImage(named: imageName), for: UIControl.State.normal)
        
        let imageWidth:CGFloat = (self.imageView?.frame.size.width)!
        let imageHeight:CGFloat = (self.imageView?.frame.size.height)!
        
        var labelWidth:CGFloat = 0.0
        var labelHeight:CGFloat = 0.0
        
        labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width)
        labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height)
        
        var imageEdgeInset: UIEdgeInsets = UIEdgeInsets()
        var labelEdgeInset: UIEdgeInsets = UIEdgeInsets()
        
        switch type {
        case .PositionTop:
            imageEdgeInset = UIEdgeInsets.init(top: -labelHeight - space/2.0, left: 0, bottom: 0, right: -labelHeight)
            labelEdgeInset = UIEdgeInsets.init(top: 0, left: -imageWidth, bottom: -imageHeight - space/2.0, right: 0)
            break
        case .PositionLeft:
            imageEdgeInset = UIEdgeInsets.init(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
            labelEdgeInset = UIEdgeInsets.init(top: 0, left: -space/2.0, bottom: 0, right: -space/2.0)
            break
        case .PositionBottom:
            imageEdgeInset = UIEdgeInsets.init(top: 0, left: 0, bottom: -labelHeight - space/2.0, right: -labelWidth)
            labelEdgeInset = UIEdgeInsets.init(top: -imageWidth-space/2.0, left: -imageWidth, bottom: 0, right: 0)
            break
        case .PositionRight:
            imageEdgeInset = UIEdgeInsets.init(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
            labelEdgeInset = UIEdgeInsets.init(top: 0, left: -imageWidth - space/2.0, bottom: 0, right: imageWidth+space/2.0)
            break
        }
        
        self.titleEdgeInsets = labelEdgeInset
        self.imageEdgeInsets = imageEdgeInset
    }
}
