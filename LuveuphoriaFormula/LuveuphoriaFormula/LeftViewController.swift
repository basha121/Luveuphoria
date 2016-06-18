//
//  LeftViewController.swift
//  LuveuphoriaFormula
//
//  Created by Parth Adroja on 6/15/16.
//
//

import UIKit

class LeftViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuItemCell")!
        if indexPath.row == 0 {
            cell.textLabel?.text = "Home"
        } else {
            cell.textLabel?.text = "About Us"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("topScreen")
            dispatch_async(dispatch_get_main_queue()) {
                self.so_containerViewController?.topViewController = vc
                self.so_containerViewController?.isSideViewControllerPresented = false
            }
        } else {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("aboutVC")
            dispatch_async(dispatch_get_main_queue()) {
                self.so_containerViewController?.topViewController = vc
                self.so_containerViewController?.isSideViewControllerPresented = false
            }
        }
    }
    
    
}
