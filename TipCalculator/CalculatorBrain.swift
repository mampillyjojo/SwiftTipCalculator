//
//  File.swift
//  TipCalculator
//
//  Created by jojo mampilly on 8/8/16.
//  Copyright © 2016 jojo mampilly. All rights reserved.
//

import Foundation





class CalculatorBrain
{
    private var accumiliator = 0.0
    
    func setOprand(oprand : Double) {
        accumiliator = oprand
    }


    
    private enum Operation {
        case  Constant(Double)
        case  UrniaryOPeration(Double -> Double)
        case  BinaryOperator ((Double,Double) -> Double)
        case  Equals
        
    }
    

    
    private var operatorDictionary : Dictionary <String, Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_PI),
        "√" : Operation.UrniaryOPeration(sqrt),
        "*" : Operation.BinaryOperator({$1 * $0}),
        "+" : Operation.BinaryOperator({$1 + $0}),
        "=" : Operation.Equals
    ]
    
    private struct BinaryOperatorDataStructure{
        var operation : (Double,Double) -> Double
        var previousOperand : Double
    }
    
    private var binaryOperatorDS : BinaryOperatorDataStructure?
    
    func performOperation(value : String) {
        let operation = operatorDictionary[value]!
        
        switch operation {
            
        case .Constant(let value): accumiliator = value
        case .UrniaryOPeration(let function) :
            accumiliator = function(accumiliator)
        case .BinaryOperator(let function) :
            if binaryOperatorDS != nil{
                performBinaryOperation()
            }
            
            binaryOperatorDS = BinaryOperatorDataStructure(operation: function, previousOperand: accumiliator)

            
        case .Equals:
            performBinaryOperation()

        }
    }
    
    private func performBinaryOperation(){
        if binaryOperatorDS != nil{
            accumiliator = binaryOperatorDS!.operation(accumiliator,binaryOperatorDS!.previousOperand)
            binaryOperatorDS = nil
            
        }
    }

    
    var result : Double {
        get{
            return accumiliator
        }
    }
    
}