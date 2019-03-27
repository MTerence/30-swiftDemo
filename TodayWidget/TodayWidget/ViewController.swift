//
//  ViewController.swift
//  TodayWidget
//
//  Created by Ternence on 2019/2/26.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var resultLabel:UILabel!
    var timer:Timer!
    var labelNumber:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let startView = UIView()
        
        resultLabel = UILabel()
        self.view.addSubview(resultLabel)
        resultLabel.textColor = UIColor.black
        resultLabel.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view.snp.centerX).offset(25)
            make.top.equalTo(100)
        }
        resultLabel.font = UIFont.systemFont(ofSize: 30)
        resultLabel.text = "0"
        
        startView.backgroundColor = UIColor.init(red: 1, green: 101/255.0, blue: 27/255.0, alpha: 1)
        self.view.addSubview(startView)
        startView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(300)
            make.left.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
            make.width.equalTo(self.view.frame.width/2)
        }
        
        let startButton:UIButton = UIButton()
        startButton.setTitle("start", for: UIControl.State.normal)
        startView.addSubview(startButton)
        startButton.snp.makeConstraints { (make) in
            make.center.equalTo(startView)
            make.width.height.equalTo(50)
        }
        startButton.addTarget(self, action: #selector(startHandler), for: UIControl.Event.touchUpInside)
        
        let endView = UIView()
        endView.backgroundColor = UIColor.init(red: 98/255.0, green: 242/255.0, blue: 23/255.0, alpha: 1)
        self.view.addSubview(endView)
        endView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(300)
            make.right.equalTo(self.view).offset(0)
            make.width.equalTo(self.view.frame.size.width/2)
            make.bottom.equalTo(self.view).offset(0)
        }
        
        let endButton:UIButton = UIButton()
        endButton.setTitle("End", for: UIControl.State.normal)
        endView.addSubview(endButton)
        endButton.snp.makeConstraints { (make) in
            make.center.equalTo(endView).offset(0)
            make.width.height.equalTo(50)
        }
        endButton.addTarget(self, action: #selector(stopHandler), for: UIControl.Event.touchUpInside)
        
        
        let resetButton = UIButton()
        self.view.addSubview(resetButton)
        resetButton.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(-10)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        resetButton.setTitle("Reset", for: UIControl.State.normal)
        resetButton.addTarget(self, action: #selector(resetHandler), for: UIControl.Event.touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignActive), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func startHandler(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
            self.labelNumber = self.labelNumber + 0.1
            self.resultLabel.text = String(format: "%0.1f", self.labelNumber)
        })
    }
    
    @objc func stopHandler() {
        guard let timerForDistory = self.timer
            else{
                return
        }
        timerForDistory.invalidate()
    }
    
    @objc func resetHandler(){
        self.labelNumber = 0
        self.resultLabel.text = "0"
    }
    
    @objc private func applicationWillResignActive() {
        if timer == nil {
            clearDefaults()
        }else{
            if timer.isValid {
                saveDefaults()
            }else{
                clearDefaults()
            }
        }
    }
    
    private func saveDefaults(){
        let userDefault = UserDefaults(suiteName: "group.jiayinghudong.xiaoban")
        userDefault?.set(self.labelNumber, forKey: "lefttime")
        userDefault?.synchronize()
    }
    
    private func clearDefaults(){
        let userDefault = UserDefaults(suiteName: "group.jiayinghudong.xiaoban")
        userDefault?.removeObject(forKey: "lefttime")
        userDefault?.synchronize()
        
    }


}

