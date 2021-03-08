//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var text: String? = ""
    var tip: Float = 0
    
    @IBAction func getValue(_ sender: UITextField) {
        text = billTextField.text ?? "Empty"
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let percentageSelected = String(sender.currentTitle!)
        billTextField.endEditing(true)
        if percentageSelected == "0%" {
            tip = 0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
        else if percentageSelected == "10%" {
            tip = 1.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        }
        else {
            tip = 1.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    var splitterValue: String = ""
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitterValue = Int(sender.value).description
        self.splitNumberLabel.text = splitterValue
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(text ?? "error")
        let split = ((bill ?? 0.0) * tip)
        let totalPay = split / Float(splitterValue)!
        print(String(format: "%.2f", totalPay))
    }
    
}

