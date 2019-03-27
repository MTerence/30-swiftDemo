//
//  ViewController.swift
//  3DTouchQuickAction
//
//  Created by Ternence on 2019/2/26.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController,UIViewControllerPreviewingDelegate {

    var actionLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        actionLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 400, height: 50))
        actionLabel.text = "Please Press the 3D Touch"
        self.view.addSubview(actionLabel)
        
        let notificationName = Notification.Name(rawValue: "ShortcutAction")
        NotificationCenter.default.addObserver(self, selector: #selector(shortCutActionClicked), name: notificationName, object: nil)
        
        let fingerPrintImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 128, height: 128))
        fingerPrintImageView.image = #imageLiteral(resourceName: "fingerprint.png")
        fingerPrintImageView.center = self.view.center
        self.view.addSubview(fingerPrintImageView)
        
        self.registerForPreviewing(with: self, sourceView: self.view)
    }
    
    func changeLabel(with name:String){
        actionLabel.text = name
    }
    
    @objc func shortCutActionClicked(sender:Notification){
        let shortcutItem = sender.userInfo?["shortcutItem"] as! UIApplicationShortcutItem
        if shortcutItem.type == "LoveItem" {
            self.changeLabel(with: "Yes, i do ❤️ you")
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.show(viewControllerToCommit, sender: self)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        previewingContext.sourceRect = CGRect(x: 10, y: 10, width: self.view.frame.width - 20, height: self.view.frame.height - 10)
        return SFSafariViewController(url: NSURL(string: "http://www.qq.com")! as URL)
    }
}

extension SFSafariViewController {
    open override var previewActionItems: [UIPreviewActionItem]{
        let deleteAction = UIPreviewAction(title: "删除", style: UIPreviewAction.Style.destructive) { (previewAction, vc) in
            print("删除")
        }
        
        let doneAction = UIPreviewAction(title: "完成", style: UIPreviewAction.Style.default) { (previewAction, vc) in
            print("完成")
        }
        
        return [deleteAction, doneAction]

    }
}

