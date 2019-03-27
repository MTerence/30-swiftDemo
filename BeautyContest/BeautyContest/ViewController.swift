//
//  ViewController.swift
//  BeautyContest
//
//  Created by Ternence on 2019/3/5.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import SnapKit
import Koloda

class ViewController: UIViewController {
    
    var kolodaView:KolodaView!
    var daraSource = Array<UIImage>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...10 {
            daraSource.append(UIImage(named: "Photo\(index)")!)
        }
        
        self.view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        kolodaView = KolodaView()
        self.view.addSubview(kolodaView)
        kolodaView.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
        }
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
    }

}

extension ViewController:KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        
    }
}

extension ViewController:KolodaViewDataSource {
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return DragSpeed.fast
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return daraSource.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: daraSource[index])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let overlayView = BeautyContestOverlayView(frame:self.kolodaView.frame)
        
        return overlayViewv
        
    }
    
    
}

