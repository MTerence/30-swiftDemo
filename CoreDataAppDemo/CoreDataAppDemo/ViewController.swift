//
//  ViewController.swift
//  CoreDataAppDemo
//
//  Created by Ternence on 2019/2/27.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    let table = UITableView()
    var dataSource = Array<TodoList>()
    let Entityname = "TodoList"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Todo List"
        
        let rightBarItem = UIBarButtonItem(title: "+", style: UIBarButtonItem.Style.done, target: self, action: #selector(addTodoList))
        self.navigationItem.rightBarButtonItem = rightBarItem

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        table.frame = self.view.frame
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        
        self.updateDataSource()
        self.table.reloadData()
    }

    @objc func addTodoList(){
        let alertController = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: UIAlertController.Style.alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default) { (_) in
            if let field = alertController.textFields![0] as? UITextField{
                self.saveContent(content: field.text!)
                self.updateDataSource()
                self.table.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "please input the todo Item"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellId")
        cell.textLabel?.text = dataSource[indexPath.row].content
        return cell
        
    }
    
    
    @objc func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    func saveContent(content:String){
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: Entityname, in: context)
        
        let todoList = NSManagedObject(entity: entity!, insertInto: context)
        
        todoList.setValue(content, forKey: "content")
        do {
            try context.save()
        } catch  {
            print(error)
        }
    }
    
    func updateDataSource(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Entityname)
        
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            dataSource = searchResults as! [TodoList]
        } catch {
            print(error)
        }
        
    }

}

