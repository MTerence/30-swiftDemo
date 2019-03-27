//
//  CustomCollectionViewCell.swift
//  Carousel Effect
//
//  Created by Ternence on 2019/3/5.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initUI()
    }
    
    func initUI(){
        imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }

    public func configCell(model:CustomCollectionViewCellModel){
        imageView.image = model.image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
