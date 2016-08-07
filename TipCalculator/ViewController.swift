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
    
    var userIsInTheMiddleOfTyping : Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
    
        let digit = sender.currentTitle!
        print("digit = \(digit)")
        
        if(userIsInTheMiddleOfTyping){
            display.text = display.text! + digit

        }else{
            display.text = digit
            userIsInTheMiddleOfTyping = true
           
        }

       
                // Test

    }
   


}

