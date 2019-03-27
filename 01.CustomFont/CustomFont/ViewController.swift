//
//  ViewController.swift
//  CustomFont
//
//  Created by Ternence on 2019/2/19.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Hello World"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        self.view .addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(100)
        }
        
        let changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("changeBtn", for: UIControl.State.normal)
        changeBtn.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        changeBtn.layer.cornerRadius = 5
        changeBtn.layer.borderWidth = 1
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        changeBtn.addTarget(self, action: #selector(onChangeBtnClick), for: UIControl.Event.touchUpInside)
        self.view .addSubview(changeBtn)
        changeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(500)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
        }
        
        printAllSupportedFontNames()
    }
    
    @objc func onChangeBtnClick(){
        label.font = UIFont.init(name: "Savoye LET", size: 30)
    }
    
    @objc func printAllSupportedFontNames(){
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("++++\(familyName)")
            
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames{
                print("----\(fontName)")
            }
            
        }
        
    }


}


