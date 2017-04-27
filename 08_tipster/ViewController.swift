//
//  ViewController.swift
//  08_tipster
//
//  Created by User on 4/26/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPercent1: UILabel!
    @IBOutlet weak var lblPercent2: UILabel!
    @IBOutlet weak var lblPercent3: UILabel!
    
    @IBOutlet weak var lblTip1: UILabel!
    @IBOutlet weak var lblTip2: UILabel!
    @IBOutlet weak var lblTip3: UILabel!
    
    @IBOutlet weak var lblTotal1: UILabel!
    @IBOutlet weak var lblTotal2: UILabel!
    @IBOutlet weak var lblTotal3: UILabel!
    
    @IBOutlet weak var lblTotal: UILabel!
    var numTotal : Double = 0
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var lblGroupSize: UILabel!
    
    
    
    @IBAction func btnNumber(sender: UIButton) {
        (sender.tag < 10) ? (lblTotal.text?.appendContentsOf(String(sender.tag))) :
            ((sender.tag == 10) ? (lblTotal.text = "") :
                (lblTotal.text?.appendContentsOf(".")))
        //0-9 is a number, 10 is clear, 11 is a decimal
        
        //keeps tarck of total in a doudle variable
        numTotal = (lblTotal.text! as NSString).doubleValue
        
    }
    
    
    @IBAction func tipChanged(sender: UISlider) {
        print(Int(sender.value))
        let percent = Int(sender.value)
        let percentBelow = Int(sender.value) - 5
        let percentAbove = Int(sender.value) + 5
        
        //sets the percentage to be calculated by
       calcul
        
        //sets the tips alone
        lblTip1.text = String(Double(percentBelow) * 0.01 * numTotal)
        lblTip2.text = String(Double(percent) * 0.01 * numTotal)
        lblTip3.text = String(Double(percentAbove) * 0.01 * numTotal)
        
        //sets the tips + totals
        lblTotal1.text = String(Double(percentBelow) * 0.01 * numTotal + numTotal)
        lblTotal2.text = String(Double(percent) * 0.01 * numTotal + numTotal)
        lblTotal3.text = String(Double(percentAbove) * 0.01 * numTotal + numTotal)

        
    }
    
    @IBAction func groupSizeChanged(sender: UISlider) {
        let percent = Int(slider.value)
        let percentBelow = Int(slider.value) - 5
        let percentAbove = Int(slider.value) + 5
        let groupSize = Int(sender.value)
        lblGroupSize.text = "Group Size: " + String(groupSize)
        
        
        //divides tips by groupsize
        lblTip1.text = String((Double(percentBelow) * 0.01 * numTotal)/Double(groupSize))
        lblTip2.text = String((Double(percent) * 0.01 * numTotal)/Double(groupSize))
        lblTip3.text = String((Double(percentAbove) * 0.01 * numTotal)/Double(groupSize))
        
        //sets the tips + totals diveded by group size
        lblTotal1.text = String((Double(percentBelow) * 0.01 * numTotal + numTotal)/Double(groupSize))
        
        lblTotal2.text = String((Double(percent) * 0.01 * numTotal + numTotal)/Double(groupSize))
        lblTotal3.text = String((Double(percentAbove) * 0.01 * numTotal + numTotal)/Double(groupSize))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTotal.text = " "
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

