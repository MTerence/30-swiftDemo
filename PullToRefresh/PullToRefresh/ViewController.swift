//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Ternence on 2019/2/21.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var dataArray = Array<Date>()
    let refreshControl = UIRefreshControl()
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame.origin.y = 44
        self.view.addSubview(tableView)
        
        addDataToDataArray()
        
        refreshControl.attributedTitle = NSAttributedString(string: "拉什么拉？ 再拉朕就要碎了!")
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        tableView.reloadData()
    }
    
    @objc func pullToRefresh(){
        addDataToDataArray()
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
    
    @objc func addDataToDataArray(){
        dataArray.insert(NSDate() as Date, at: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellid")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年mm月dd日/hh时mm分ss秒"
        let dateStr = dateFormatter.string(from: dataArray[indexPath.row])
        cell.textLabel?.text = dateStr
        
        
        return cell
        
    }


}

