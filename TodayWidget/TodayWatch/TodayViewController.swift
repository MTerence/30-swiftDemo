//
//  TodayViewController.swift
//  TodayWatch
//
//  Created by Ternence on 2019/2/26.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var currentTime: UILabel!
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults(suiteName: "group.jiayinghudong.xiaoban")
        var leftTimeWhenQuit = userDefaults?.double(forKey: "lefttime")
        
        currentTime.text = String(format: "%0.1f", leftTimeWhenQuit!)
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
            leftTimeWhenQuit = leftTimeWhenQuit! + 0.1
            self.currentTime.text = String(format: "%0.1f", leftTimeWhenQuit!)
        })
        self.timer.fire()
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
}
