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
    
    var text: String? = ""  //text entered in textBox
    var tip: Float = 0  //tip percentage
    var splitterValue: Int = 0 //split between how many people
    var result: String = ""
    
    @IBAction func getValue(_ sender: UITextField) {
        text = billTextField.text ?? "Empty"    //text field deafault data type is string
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let percentageSelected = String(sender.currentTitle!)
        billTextField.endEditing(true)  //to hide the keyboard
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
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitterValue = Int(sender.value)   
        self.splitNumberLabel.text = String(splitterValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(text ?? "error")
        let split = ((bill ?? 0.0) * tip) / Float(splitterValue)
        result = (String(format: "%.2f", split))
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = result
        }
    }
    
}

