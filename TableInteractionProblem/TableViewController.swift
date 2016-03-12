//
//  TableViewController.swift
//  TableInteractionProblem
//
//  Created by Rafael M. A. da Silva on 3/12/16.
//  Copyright © 2016 munhra. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    
    var tableItems = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "insertElementWithAnimation", userInfo: nil, repeats: true)
    }
    
    func insertElementWithAnimation() {
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
            let customer = "CUSTOMER_INFO"
            self.tableItems.append(customer)
            self.tableView.beginUpdates()
            let newIndexPathArray = [NSIndexPath(forItem: 0, inSection: 0)]
            self.tableView.insertRowsAtIndexPaths(newIndexPathArray, withRowAnimation: UITableViewRowAnimation.Top)
            self.tableView.endUpdates()
        }, completion: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID",forIndexPath: indexPath)
        cell.textLabel!.text = self.tableItems[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row Selected")
    }
    
}
