//
//  ViewController.swift
//  Limit Input Text
//
//  Created by Ternence on 2019/2/20.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    var limitedTextView:UITextView!
    var allowInputNumberLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.initNavigationBar()
        self.initInputField()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(noti:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func initNavigationBar() {
        let leftItem = UIBarButtonItem(title: "Close", style: UIBarButtonItem.Style.plain, target: self, action: #selector(onCloseButtonClick))
        
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func initInputField() {
        let naviFrame = self.navigationController?.navigationBar.frame
        let statusFrame = UIApplication.shared.statusBarFrame
        let iconImageView = UIImageView(frame: CGRect(x: 0, y: (naviFrame?.height)! + statusFrame.height + 10, width: 70, height: 70))
        
        iconImageView.image = UIImage.init(named: "avatar.jpg")
        self.view.addSubview(iconImageView)
        
        limitedTextView = UITextView(frame: CGRect(x: 80, y: iconImageView.frame.size.height, width: self.view.frame.width - 80 - 20, height: 300))
        limitedTextView.delegate = self
        limitedTextView.font = UIFont.systemFont(ofSize: 20)
        limitedTextView.backgroundColor = UIColor.lightGray
        limitedTextView.layer.cornerRadius = 10
        self.view.addSubview(limitedTextView)
        
        allowInputNumberLabel = UILabel(frame: CGRect(x: self.view.frame.width - 50, y: self.view.frame.height - 50, width: 50, height: 40))
        allowInputNumberLabel.text = "140"
        allowInputNumberLabel.textAlignment = NSTextAlignment.right
        self.view.addSubview(allowInputNumberLabel)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let currentCharactorCount = textView.text.count
        if currentCharactorCount >= 140 {
            limitedTextView.resignFirstResponder()
        }
        
        allowInputNumberLabel.text = "\(140 - currentCharactorCount)"
    }
    
    @objc func onCloseButtonClick (){
        if limitedTextView.isFirstResponder {
            limitedTextView .resignFirstResponder()
        } 
    }
    
    @objc func keyboardWillChangeFrame(noti:Notification){
        
    }


}

