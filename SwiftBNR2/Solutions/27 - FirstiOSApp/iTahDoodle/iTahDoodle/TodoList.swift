//
//  TodoList.swift
//  iTahDoodle
//
//  Created by John Gallagher on 2/11/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    private let fileURL: NSURL = {
        let documentDirectoryURLs = NSFileManager.defaultManager().URLsForDirectory(
            .DocumentDirectory, inDomains: .UserDomainMask) 
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.URLByAppendingPathComponent("todolist.items")
    }()

    private var items: [String] = []

    override init() {
        super.init()
        loadItems()
    }

    func saveItems() {
        let itemsArray = items as NSArray

        print("Saving items to \(fileURL)")
        if !itemsArray.writeToURL(fileURL, atomically: true) {
            print("Could not save todo list")
        }
    }

    func loadItems() {
        if let itemsArray = NSArray(contentsOfURL: fileURL) as? [String] {
            items = itemsArray
        }
    }

    func addItem(item: String) {
        items.append(item)
        saveItems()
    }
}

extension TodoList : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        let item = items[indexPath.row]

        cell.textLabel!.text = item

        return cell
    }
}