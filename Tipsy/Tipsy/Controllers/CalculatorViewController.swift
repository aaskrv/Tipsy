//
//  ViewController.swift
//  Tipsy
//
//  Created by Adilet on 4/8/20.
//  Copyright © 2020 Adilet. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numPeople = 2
    var billTotal = 0.0
    var resultBill = 0.0

    @IBAction func calculatePressed(_ sender: UIButton) {
        if let bill = billTextField.text {
            billTotal = Double(bill)!
        
            resultBill = billTotal * (1 + tip) / Double(numPeople)
            
            print(String(format: "%.2f", resultBill))
        }
        performSegue(withIdentifier: "goToResults", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = resultBill
            destinationVC.tip = tip
            destinationVC.numPeople = numPeople
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f" ,sender.value)
        numPeople = Int(sender.value)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let chosenTip = Double(String((sender.currentTitle!).dropLast()))!
        
        tip = chosenTip / 100
        
    }
    
}

