//
//  ViewController.swift
//  08_tipster
//
//  Created by User on 4/26/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPercent1: UILabel!//row one
    @IBOutlet weak var lblPercent2: UILabel!
    @IBOutlet weak var lblPercent3: UILabel!
    
    @IBOutlet weak var lblTip1: UILabel!//row two
    @IBOutlet weak var lblTip2: UILabel!
    @IBOutlet weak var lblTip3: UILabel!
    
    @IBOutlet weak var lblTotal1: UILabel!//row three
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

        
        //sets the percentage to be calculated by
        setPercentages(percent)
        
        //sets the tips alone
        setTips(percent)
        
        //sets the tips + totals
        setTipPlusTotal(percent)
    }
    
    @IBAction func groupSizeChanged(sender: UISlider) {
        let percent = Int(slider.value)
        let groupSize = Int(sender.value)
        lblGroupSize.text = "Group Size: " + String(groupSize)
        
        
        //divides tips by groupsize
        divideTipByGroupSize(percent, groupSize: groupSize)
        
        //sets the tips + totals diveded by group size
        groupTotal(percent, groupSize: groupSize)
    }
    
   
    
    func setPercentages(percent: Int)
    {
        lblPercent2.text = String(percent) + "%" //middle percentatge
        lblPercent1.text = String(percent - 5) + "%"
        lblPercent3.text = String(percent + 5) + "%"
    }
    
    func setTips(percent : Int)
    {
        print("Helloooooo", percent)
        lblTip1.text = String(Double(percent - 5) * 0.01 * numTotal)
        lblTip2.text = String(Double(percent) * 0.01 * numTotal)
        lblTip3.text = String(Double(percent + 5) * 0.01 * numTotal)
    }
    
    func setTipPlusTotal(percent : Int)
    {
        lblTotal1.text = String(Double(percent - 5) * 0.01 * numTotal + numTotal)
        lblTotal2.text = String(Double(percent) * 0.01 * numTotal + numTotal)
        lblTotal3.text = String(Double(percent + 5) * 0.01 * numTotal + numTotal)
    }
    
    func divideTipByGroupSize(percent: Int, groupSize: Int)
    {
        lblTip1.text = String((Double(percent - 5 ) * 0.01 * numTotal)/Double(groupSize))
        lblTip2.text = String((Double(percent) * 0.01 * numTotal)/Double(groupSize))
        lblTip3.text = String((Double(percent + 5) * 0.01 * numTotal)/Double(groupSize))
    }
    
    func groupTotal(percent: Int, groupSize: Int)
    {
        lblTotal1.text = String((Double(percent - 5) * 0.01 * numTotal + numTotal)/Double(groupSize))
        lblTotal2.text = String((Double(percent) * 0.01 * numTotal + numTotal)/Double(groupSize))
        lblTotal3.text = String((Double(percent + 5) * 0.01 * numTotal + numTotal)/Double(groupSize))
    }
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////
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

