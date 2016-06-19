//
//  AboutViewController.swift
//  LuveuphoriaFormula
//
//  Created by Parth Adroja on 6/15/16.
//
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBAction func showMeMyMenu () {
        if let container = self.so_containerViewController {
            container.isSideViewControllerPresented = true
        }
    }

}
