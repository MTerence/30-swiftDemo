//
//  ViewController.swift
//  GradientinTableView
//
//  Created by Ternence on 2019/2/25.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    private let cellHeight:CGFloat = 66
    private let colorRatio:CGFloat = 10
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    private var dataSource:Array<String>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let table = UITableView(frame: self.view.frame)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.view.addSubview(table)
        
        self.dataSource = lyric.split(separator: ",").map(String.init)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let uid = "reuseId"
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: uid)
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.cellHeight))
        
        let gradientLayer = CAGradientLayer()
        let loweColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio/255.0), alpha: 1.0).cgColor
        let upperColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, alpha: 1.0).cgColor
        
        
        gradientLayer.colors = [loweColor, upperColor];
        bgView.layer.addSublayer(gradientLayer)
        cell.addSubview(bgView)
        cell.sendSubviewToBack(bgView)
        
        
        
        
    }


}

