//
//  ViewController.swift
//  Emoji Slot Machine
//
//  Created by Ternence on 2019/2/25.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    var slotMachine: UIPickerView!
    var emojiArray = ["😀","😎","😈","👻","🙈","🐶","🌚","🍎","🎾","🐥","🐔"]
    var resultLabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createSlotMachine()
    }
    
    func createSlotMachine(){
        slotMachine = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220))
        slotMachine.delegate = self
        slotMachine.dataSource = self
        slotMachine.center.x = self.view.center.x
        slotMachine.center.y = self.view.center.y - 50
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 0, animated: false)
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 1, animated: false)
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 2, animated: false)
        self.view.addSubview(slotMachine)
        
        let goButton = UIButton(type: UIButton.ButtonType.roundedRect)
        goButton.backgroundColor = UIColor.lightGray
        goButton.frame = CGRect(x: 0, y: 0, width: 275, height: 40)
        goButton.setTitle("Go", for: UIControl.State.normal)
        goButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        goButton.center.y = self.view.center.y + 140
        goButton.center.x = self.view.center.x
        goButton.addTarget(self, action: #selector(onGoButtonClick(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(goButton)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(longTapAction));
        doubleTapGesture.numberOfTapsRequired = 2
        goButton.addGestureRecognizer(doubleTapGesture)
        
        resultLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        resultLabel.textAlignment = NSTextAlignment.center
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        resultLabel.text = ""
        resultLabel.textColor = UIColor.black
        self.view.addSubview(resultLabel)
        resultLabel.center.x = self.view.center.x
        resultLabel.center.y = goButton.center.y + 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojiArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 90
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.text = emojiArray[row]
        pickerLabel.textAlignment = NSTextAlignment.center
        pickerLabel.font = UIFont.systemFont(ofSize: 60)
        
        return pickerLabel
    }
    
    @objc func onGoButtonClick(sender:UIButton){
        slotMachine.selectRow(Int(arc4random()) % (emojiArray.count - 2) + 1, inComponent: 0, animated: true)
        slotMachine.selectRow(Int(arc4random()) % (emojiArray.count - 2) + 1, inComponent: 1, animated: true)
        slotMachine.selectRow(Int(arc4random()) % (emojiArray.count - 2) + 1, inComponent: 2, animated: true)
        
        self.judge()
    }
    
    @objc func longTapAction(){
        let result = Int(arc4random()) % (emojiArray.count - 2)
        
        slotMachine.selectRow(result + 1, inComponent: 0, animated: true)
        slotMachine.selectRow(result + 1, inComponent: 1, animated: true)
        slotMachine.selectRow(result + 1, inComponent: 2, animated: true)
        
        self.judge()
    }
    
    func judge(){
        if slotMachine.selectedRow(inComponent: 0) == slotMachine.selectedRow(inComponent: 1) && slotMachine.selectedRow(inComponent: 1) == slotMachine.selectedRow(inComponent: 2) {
            resultLabel.text = "👏👏👏"
        }else{
            resultLabel.text = "💔💔💔"
        }
    }


}

