//
//  BillBrain.swift
//  Tipsy
//
//  Created by Basit Tri Anggoro on 15/11/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct BillBrain {
    var billValue:Float?
    var tipValue:Int?
    var splitValue:Int?
    var totalBill:Float?
    
    mutating func calculateBill(bill: Float?, tip: Int?, split: Int?){
        if let b = bill, let t = tip, let s = split{
            billValue = b
            tipValue = t
            splitValue = s
            totalBill = (b+(b*(Float(t)/100)))/Float(s)
            totalBill = get2Decimal(value: totalBill!)
        }
    }

    func get2Decimal(value: Float)->Float{
        let result = Float(String(format: "%.2f", value))!
        return result
    }
}
