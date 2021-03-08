//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Vivek Bhadula on 07/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = total
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
