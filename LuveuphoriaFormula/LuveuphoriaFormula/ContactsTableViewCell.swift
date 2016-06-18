//
//  ContactsTableViewCell.swift
//  LuveuphoriaFormula
//
//  Created by Parth Adroja on 6/18/16.
//
//

import UIKit

protocol ContactsTableViewCellDelegate {
    func stepperValueChanged(sender: UIStepper,keyName: String)
}

class ContactsTableViewCell: UITableViewCell {

    var contactsTableViewCellDelegate: ContactsTableViewCellDelegate?
    
    @IBOutlet weak var IBlblCounts: UILabel!
    
    @IBAction func IBbtnStepperTap(sender: UIStepper) {
        IBlblCounts.text = Int(sender.value).description
        let keyName = IBlblItems.text
        contactsTableViewCellDelegate?.stepperValueChanged(sender, keyName: keyName!)
    }
    
    @IBOutlet weak var IBbtnStepper: UIStepper!
    @IBOutlet weak var IBlblItems: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
