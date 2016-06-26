//
//  LeftViewController.swift
//  LuveuphoriaFormula
//
//  Created by Parth Adroja on 6/15/16.
//
//

import UIKit
import MessageUI

class LeftViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuItemCell")!
        if indexPath.row == 0 {
            cell.textLabel?.text = "Home"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "About App"
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "Terms and Conditions"
        } else if indexPath.row == 3 {
            cell.textLabel?.text = "Read Our Blog"
        } else if indexPath.row == 4 {
            cell.textLabel?.text = "Tips for couples"
        } else if indexPath.row == 5 {
            cell.textLabel?.text = "Contact Us"
        } else if indexPath.row == 6 {
            cell.textLabel?.text = "Share"
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
        } else if indexPath.row == 1 {
            let aboutVC = self.storyboard?.instantiateViewControllerWithIdentifier("aboutVC")
            dispatch_async(dispatch_get_main_queue()) {
                self.so_containerViewController?.topViewController = aboutVC
                self.so_containerViewController?.isSideViewControllerPresented = false
            }
        } else if indexPath.row == 2 {
            let termsVC = self.storyboard?.instantiateViewControllerWithIdentifier("termsVC")
            dispatch_async(dispatch_get_main_queue()) {
                self.so_containerViewController?.topViewController = termsVC
                self.so_containerViewController?.isSideViewControllerPresented = false
            }
            
        } else if indexPath.row == 3 {
            if let url = NSURL(string: "http://www.advancedmarriagetraining.com/Blog.html") {
                UIApplication.sharedApplication().openURL(url)
            }
        } else if indexPath.row == 4 {
            if let url = NSURL(string: "http://www.advancedmarriagetraining.com/Tips%20for%20Couples.html") {
                UIApplication.sharedApplication().openURL(url)
            }
        } else if indexPath.row == 5 {
            sendEmail()
        } else {
            shareApp()
        }
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["moreinfo@advancedmarriagetraining.com"])
            mail.setMessageBody("<p>Enter Your Queries</p>", isHTML: true)
            
            presentViewController(mail, animated: true, completion: nil)
        } else {
            // show failure alert
        }
    }
    
    func shareApp() {
        let shareText = "Calculate your love with our new app for iOS and Android. #Luvephoria App."
        let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
