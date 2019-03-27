//
//  ViewController.swift
//  Basic Animations
//
//  Created by Ternence on 2019/2/27.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    private let cellHeight:CGFloat = 66
    var tableView:UITableView!
    private let dataSource = ["Position","Opacity","Scale","Color","Rotation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        tableView = UITableView(frame: self.view.frame)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellId")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(PositionAnimationViewController(), animated: true)
            
        case 1:
            self.navigationController?.pushViewController(OpacityAnimationViewController(), animated: true)
            
        case 2:
            self.navigationController?.pushViewController(ScaleAnimationViewController(), animated: true)
            
            
        case 3:
            self.navigationController?.pushViewController(ColorAnimationViewController(), animated: true)
            
        case 4:
            self.navigationController?.pushViewController(RotationAnimationViewController(), animated: true)
            
        default:
            return
            
        }
    }

}

