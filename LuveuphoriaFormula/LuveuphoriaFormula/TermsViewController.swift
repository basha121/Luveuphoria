//
//  TermsViewController.swift
//  LuveuphoriaFormula
//
//  Created by Parth Adroja on 6/19/16.
//
//

import UIKit

class TermsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showMeMyMenu () {
        if let container = self.so_containerViewController {
            container.isSideViewControllerPresented = true
        }
    }

}
