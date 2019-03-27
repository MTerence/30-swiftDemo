//
//  ViewController.swift
//  Carousel Effect
//
//  Created by Ternence on 2019/3/5.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView:UICollectionView!
    var dataSource:Array<CustomCollectionViewCellModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgView = UIView(frame: self.view.bounds)
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = #imageLiteral(resourceName: "bg")
        bgView.addSubview(bgImageView)
        
        let blurEffect:UIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView:UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        bgView.addSubview(blurView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundView = bgView
    
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(collectionView)
        
        let model1 = CustomCollectionViewCellModel()
        model1.image = #imageLiteral(resourceName: "Photo3")
        
        let model2 = CustomCollectionViewCellModel()
        model2.image = #imageLiteral(resourceName: "Photo5")
        
        let model3 = CustomCollectionViewCellModel()
        model3.image = #imageLiteral(resourceName: "Photo2")
        
        let model4 = CustomCollectionViewCellModel()
        model4.image = #imageLiteral(resourceName: "Photo1")
        
        let model5 = CustomCollectionViewCellModel()
        model5.image = #imageLiteral(resourceName: "Photo4")
        
        dataSource = Array(arrayLiteral: model1, model2, model3, model4, model5)
        
        
        let segmentView = UISegmentedControl(items: ["FlowLayout","CustomLayout"])
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white as AnyObject]
        segmentView.setTitleTextAttributes(titleTextAttributes, for: UIControl.State.normal)
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black as AnyObject], for: UIControl.State.selected)
        segmentView.tintColor = UIColor.white
        segmentView.isMomentary = false
        segmentView.frame = CGRect(x: 10, y: 50, width: self.view.frame.width - 20, height: segmentView.bounds.height)
        segmentView.selectedSegmentIndex = 0
        segmentView.addTarget(self, action: #selector(action_segmentValueChanged(sender:)), for: UIControl.Event.valueChanged)
        self.view.addSubview(segmentView)
    
    }
    
    @objc func action_segmentValueChanged(sender:UISegmentedControl){
        let layout = sender.selectedSegmentIndex == 0 ? UICollectionViewFlowLayout() : CustomCollectionViewLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView.collectionViewLayout = layout
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.configCell(model: self.dataSource[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

