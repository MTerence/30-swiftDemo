//
//  MenuViewController.swift
//  SlideNavigation
//
//  Created by Ternence on 2019/2/28.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class MenuViewController: SWRevealViewController,UITableViewDelegate, UITableViewDataSource {

    var dataSource: Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        dataSource = ["AnimatedCell","Slot Machine","Limited Input"]
        self.view.backgroundColor = UIColor.red
        let tableView = UITableView(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellId")
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.textLabel?.text = self.dataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var newViewController:UIViewController!
        
        switch indexPath.row {
        case 0:
            newViewController = ViewController()
            
        case 1:
            newViewController = SecondViewController()
        default:
            newViewController = ThirdViewController()
        }
        
        let navigationController = UINavigationController(rootViewController: newViewController)
        self.revealViewController()?.pushFrontViewController(newViewController, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

}
