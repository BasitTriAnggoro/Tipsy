//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var bill = BillBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        billTextField.endEditing(true)
        
        if sender.titleLabel!.text == "0%"{
            zeroPctButton.isSelected = true
            bill.tipValue = 0
        }else if sender.titleLabel!.text == "10%"{
            tenPctButton.isSelected = true
            bill.tipValue = 10
        }else{
            twentyPctButton.isSelected = true
            bill.tipValue = 20
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bill.calculateBill(bill: Float(billTextField.text ?? "0.1"), tip: bill.tipValue ?? 10, split: Int(splitNumberLabel.text ?? "2"))
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultsViewController
        resultVC.bill = self.bill
    }
}

