//
//  CategoryPickerTableViewController.swift
//  MyLocations
//
//  Created by Patrick Schneider on 10/11/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import UIKit

class CategoryPickerViewController: UITableViewController {
    // MARK: Properties
    var selectedCategoryName = ""
    let categories = [
        "No Category",
        "Apple Store",
        "Bar",
        "Bookstore",
        "Club",
        "Grocery Store",
        "Historic Building",
        "House",
        "Icecream Vendor",
        "Landmark",
        "Park"
    ]
    var selectedIndexPath = NSIndexPath()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<categories.count {
            if categories[i] == selectedCategoryName {
                selectedIndexPath = NSIndexPath(forRow: i, inSection: 0)
                break
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // also called on unwind segues
        if segue.identifier == "PickedCategory" {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPathForCell(cell) {
                selectedCategoryName = categories[indexPath.row]
            }
        }
    }

    // MARK: Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let categoryName = categories[indexPath.row]
        cell.textLabel!.text = categoryName

        cell.accessoryType = (categoryName == selectedCategoryName) ? .Checkmark : .None
        return cell
    }

    // MARK: table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row != selectedIndexPath.row {
            if let newCell = tableView.cellForRowAtIndexPath(indexPath) {
                newCell.accessoryType = .Checkmark
            }
            if let oldCell = tableView.cellForRowAtIndexPath(selectedIndexPath) {
                oldCell.accessoryType = .None
            }
            selectedIndexPath = indexPath
        }
    }
}
