//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Brigitte Michau on 2016/03/12.
//  Copyright © 2016 Brigitte Michau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let todoList = ToDoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = todoList
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
        
        guard let text = itemTextField.text where text != "" else {
            return
        }
        todoList.addItem(text)
        itemTextField.text = ""
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let deleteIndex = indexPath.row
        
        todoList.removeItemAtIndex(deleteIndex)
        
        tableView.beginUpdates()
        tableView.deleteRowsAtIndexPaths([indexPath],
            withRowAnimation: UITableViewRowAnimation.Automatic)
        tableView.endUpdates()

    }
}
