//
//  TopViewController.swift
//  LuveuphoriaFormula
//
//  Created by Parth Adroja on 6/15/16.
//
//

import UIKit

class TopViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var IBtxtNonSexCount: UITextField!

    @IBOutlet weak var IBtxtNoDays: UITextField!
    @IBOutlet weak var IBlblValue: UILabel!
    
    @IBAction func IBbtnCalculate(sender: AnyObject) {
        let ns = Double(IBtxtNonSexCount.text!)
        let nd = Double(IBtxtNoDays.text!)
        var calculation = (log10(ns!/nd!)*10) - 1
        calculation = round(calculation)
        print(calculation)
        IBlblValue.text = String(calculation)
     }
    
    @IBAction func showMeMyMenu () {
        if let container = self.so_containerViewController {
            container.isSideViewControllerPresented = true
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}