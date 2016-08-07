//
//  ViewController.swift
//  TipCalculator
//
//  Created by jojo mampilly on 8/3/16.
//  Copyright © 2016 jojo mampilly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var tipDispaly: UILabel!
    
    var userIsInTheMiddleOfTyping : Bool = false
    var isTipDisplayed : Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
    
        let digit = sender.currentTitle!
        print("digit = \(digit)")
        
//        if(isTipDisplayed){
//            display.text = "0"
//        }
        
        if(userIsInTheMiddleOfTyping){
            display.text = display.text! + digit

        }else{
            display.text = digit
            tipDispaly.text = "0"
            userIsInTheMiddleOfTyping = true
           
        }

       
                // Test

    }
   

    @IBAction func onEnterClicked(sender: AnyObject) {
        let value:Float? = Float(display.text!)
        tipDispaly.hidden = false;
        
        tipDispaly.text = "$" + String(value!/8)
        isTipDisplayed = true
        userIsInTheMiddleOfTyping = false
    }

}

