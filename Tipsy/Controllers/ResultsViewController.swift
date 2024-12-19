//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Basit Tri Anggoro on 12/11/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var bill: BillBrain?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tb = bill?.totalBill, let s = bill?.splitValue, let t = bill?.tipValue{
            totalLabel.text = String(tb)
            settingsLabel.text = "Split between \(s) people, with \(t)% tip."
            print("a")
        }else{
            totalLabel.text = "Recalculating.."
            settingsLabel.text = "Recalculating.."
            DispatchQueue.main.async{
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
