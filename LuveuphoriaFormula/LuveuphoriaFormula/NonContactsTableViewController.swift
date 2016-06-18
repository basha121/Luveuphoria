//
//  NonContactsTableViewController.swift
//  LuveuphoriaFormula
//
//  Created by Parth Adroja on 6/18/16.
//
//

import UIKit

protocol NonContactsTableViewControllerDelegate {
    func getTotalNonSexualCounts(count: Int)
}

class NonContactsTableViewController: UITableViewController,ContactsTableViewCellDelegate {

    var nonContactsTableViewControllerDelegate: NonContactsTableViewControllerDelegate?
    let arrContactsList = ["Hugs",
        "Back Rubs",
        "Holding hands",
        "Walks(not speed walking)",
        "Foot massage",
        "Body massage",
        "Gentle touch to the face",
        "Arm around shoulder",
        "Hand on thigh or knee (Remember Non-sexual)",
        "Dancing together",
        "Napping in the same bed (or one sofa, close together on the floor, etc)",
        "Caressing and stroking the body, over clothing or under clothes/without clothes on",
        "Nuzzling",
        "Scratching",
        "Biting",
        "Spooning (non-sexual)",
        "Playing with hair",
        "Kissing the body (excluding the genital region and possibly breasts)",
        "Kissing the mouth (close-mouthed, no tongue)",
        "Kissing the mouth (open-mouthed, with or without tongue)",
        "Gentle touch on the shoulder",
        "Body caress (non-sexual and making sure it is wanted)",
        "Sitting close enough that bodies touch",
        "Arm around waist",
        "Playful (Wanted) tickling",
        "Scratching those hard to reach places",
        "Cuddling, with clothes on",
        "Cuddling, with clothes off (typically, with underwear still on)"
    ]
    
    var dataDict = [String: Int]()
    
    var contactsCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "donePressed:")
        self.navigationItem.leftBarButtonItem = newBackButton;
    }
    
    func donePressed(sender: UIBarButtonItem) {
        let arrContactsCount = Array(dataDict.values)
        let totalCount = arrContactsCount.reduce(0, combine: +)
        nonContactsTableViewControllerDelegate?.getTotalNonSexualCounts(totalCount)
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrContactsList.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contactsCell", forIndexPath: indexPath) as! ContactsTableViewCell
        
        cell.IBlblItems.text = arrContactsList[indexPath.row]
        
        cell.contactsTableViewCellDelegate = self
        
        if let safeDict = dataDict["\(cell.IBlblItems.text!)"] {
            cell.IBlblCounts.text = String(safeDict)
        } else {
            cell.IBlblCounts.text = "0"
        }
        
        return cell
    }
    
    func stepperValueChanged(sender: UIStepper, keyName: String) {
        if let _ = dataDict["\(keyName)"] {
            dataDict["\(keyName)"] = Int(sender.value)
        } else {
            dataDict["\(keyName)"] =  Int(sender.value)
        }
    }
}
