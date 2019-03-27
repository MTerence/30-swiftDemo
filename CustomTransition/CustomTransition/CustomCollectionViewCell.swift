//
//  CustomCollectionViewCell.swift
//  CustomTransition
//
//  Created by Ternence on 2019/2/28.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configCell(model:CustomCollectionViewCellModel){
        imageView = UIImageView(frame: self.bounds)
        imageView.image = model.image
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(codeo: has not been implemented")
    }
}
