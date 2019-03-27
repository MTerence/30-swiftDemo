//
//  ViewController.swift
//  Stretchy Header
//
//  Created by Ternence on 2019/2/25.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    private let cellHeight:CGFloat = 66
    private let colorRatio:CGFloat = 10
    var bannerImageView:UIImageView!
    var table:UITableView!
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile"
    private var dataSource:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = UITableView()
        table.frame = CGRect(x: 0, y: self.view.frame.width + 10, width: self.view.frame.size.width, height: self.view.frame.height - self.view.frame.width - 10)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.view.addSubview(table)
        
        bannerImageView = UIImageView(image: UIImage.init(named: "banner"))
        bannerImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        bannerImageView.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.addSubview(bannerImageView)
        
        self.dataSource = lyric.split(separator: ",").map(String.init)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        table.reloadData()
        let cells = table.visibleCells
        let tableHeight:CGFloat = table.bounds.size.height
        
        for (index, cell) in cells.enumerated() {
            cell.frame.origin.y = tableHeight
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.frame.origin.y = 0
            }, completion: nil)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellId")
        
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.frame.origin.y = self.cellHeight
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let maxOffsetY = table.frame.height
        
        let validateOffsetY = -offsetY/maxOffsetY
        let scaleFactor = 1 + validateOffsetY
        
        bannerImageView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    }


}

