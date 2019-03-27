//
//  InterfaceController.swift
//  WatchKit.Extension Extension
//
//  Created by Ternence on 2019/2/27.
//  Copyright © 2019 Ternence. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController,WCSessionDelegate {

    @IBOutlet weak var resultSlider: WKInterfaceSlider!
    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    @IBOutlet weak var resultConfirmButton: WKInterfaceButton!
    @IBOutlet weak var resultOfGuess: WKInterfaceLabel!
    
    var numberToBeGuessed:Int!
    var numberOfSlider:Int = 3
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    @IBAction func sliderUpdate(_ value: Float) {
        numberOfSlider = Int(value * 5)
        resultLabel.setText("Your guess :\(numberOfSlider)")
    }
    
    @IBAction func guessAction() {
        if numberToBeGuessed == nil {
            resultOfGuess.setText("Open iPhone App first")
        }
        else if numberOfSlider == numberToBeGuessed {
            resultOfGuess.setText("回答正确❤️")
        }
        else {
            resultOfGuess.setText("再猜一次💔")
        }
    }
    
    override func willActivate() {
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        numberToBeGuessed = applicationContext["numberToBeGuessed"] as! Int
    }

}
