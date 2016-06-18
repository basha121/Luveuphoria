//
//  TopViewController.swift
//  LuveuphoriaFormula
//
//  Created by Parth Adroja on 6/15/16.
//
//

import UIKit

class TopViewController: UIViewController ,UITextFieldDelegate, NonContactsTableViewControllerDelegate {
    @IBOutlet weak var IBtxtNonSexCount: UILabel!

    @IBOutlet weak var IBtxtNoDays: UITextField!
    @IBOutlet weak var IBlblValue: UILabel!
    @IBOutlet weak var IBlblLFRange: UILabel!
    @IBOutlet weak var IBslideRange: UISlider!
    
    var nonSexualTouches: Int?
    var numberOfDays: Int?
    var luvCount: Int?
    
    override func viewDidLoad() {
        IBtxtNonSexCount.text = "0"
        IBtxtNoDays.text = "0"
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    @IBAction func IBbtnCalculate(sender: AnyObject) {
        IBtxtNoDays.resignFirstResponder()
        if let nonSexualTouches = nonSexualTouches, let numberOfDays = numberOfDays {
            let ns = Double(nonSexualTouches)
            let nd = Double(numberOfDays)
            var calculation = (log10(ns/nd)*10) - 1
            calculation = round(calculation)
            print(calculation)
            if calculation < 0 {
                calculation = 0
            }
            IBlblValue.text = "Luveuphoria Score: \(String(Int(calculation)))"
            IBslideRange.hidden = false
            IBlblLFRange.hidden = false
            if calculation == 0 {
                IBslideRange.setValue(Float(calculation), animated: true)
                IBlblLFRange.text = "Luveuphoria Range = Freezing"
            } else if calculation == 1 || calculation == 2 {
                IBslideRange.setValue(Float(calculation), animated: true)
                IBlblLFRange.text = "Luveuphoria Range = Cold"
            } else if calculation >= 3 && calculation <= 5 {
                IBslideRange.setValue(Float(calculation), animated: true)
                IBlblLFRange.text = "Luveuphoria Range = Warm"
            } else if calculation >= 6 && calculation <= 7 {
                IBslideRange.setValue(Float(calculation), animated: true)
                IBlblLFRange.text = "Luveuphoria Range = Hot"
            } else if calculation >= 8 && calculation <= 10 {
                IBslideRange.setValue(Float(calculation), animated: true)
                IBlblLFRange.text = "Luveuphoria Range = Extremely Hot"
            } else if calculation >= 11 {
                IBslideRange.setValue(Float(calculation), animated: true)
                IBlblLFRange.text = "Luveuphoria Range = Explosive"
            }
            
        } else {
            let alert = UIAlertController(title: "OOPS", message: "Please enter non-sexual intimacy contacts / number of days", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
     }
    
    @IBAction func showMeMyMenu () {
        if let container = self.so_containerViewController {
            container.isSideViewControllerPresented = true
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == IBtxtNoDays {
            if IBtxtNoDays.text?.characters.count != 0 {
                numberOfDays = Int(IBtxtNoDays.text!)
            } else {
                IBtxtNoDays.text = String(numberOfDays)
            }
        }
        textField.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func IBbtnNonSexualTap(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "contactsSegue" {
            let nonContactsVC = segue.destinationViewController as? NonContactsTableViewController
            nonContactsVC!.nonContactsTableViewControllerDelegate = self
        }
    }
    
    func getTotalNonSexualCounts(count: Int) {
        print("TOTAL COUNTS \(count)")
        IBtxtNonSexCount.text = String(count)
        nonSexualTouches = count
    }
}