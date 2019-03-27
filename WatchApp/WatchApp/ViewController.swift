//
//  ViewController.swift
//  WatchApp
//
//  Created by Ternence on 2019/2/27.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController,WCSessionDelegate {

    var wcsession: WCSession!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let generateNumberBtn = UIButton(type: .custom)
        generateNumberBtn.frame = CGRect(x: 10, y: 10, width: 200, height: 50)
        generateNumberBtn.setTitle("Generate Number", for: .normal)
        generateNumberBtn.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(generateNumberBtn)
        generateNumberBtn.center = self.view.center
        generateNumberBtn.addTarget(self, action: #selector(generateNumber), for: .touchUpInside)
        generateNumberBtn.setTitleColor(UIColor.red, for: .highlighted)
        generateNumberBtn.setTitleColor(UIColor.green, for: .selected)
        generateNumberBtn.layer.borderColor = UIColor.black.cgColor
        generateNumberBtn.layer.borderWidth = 1
        generateNumberBtn.layer.cornerRadius = 8
        
        wcsession = WCSession.default
        if WCSession.isSupported(){
            wcsession.delegate = self
            wcsession.activate()
        }
        
        self.view.backgroundColor = UIColor.yellow
    }
    
    @objc func generateNumber(){
        let number:Int = Int(arc4random()) % 5 + 1
        
        do {
            try wcsession.updateApplicationContext(["numberToBeGuessed": number])
        } catch {
            print("Error Happened!")
        }
        
        print("1")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("")
    }


}

