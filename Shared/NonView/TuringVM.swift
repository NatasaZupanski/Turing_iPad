//
//  TuringVM.swift
//  Turing_iPad (iOS)
//
//  Created by Natasa Zupanski on 4/30/21.
//

//import Foundation

import Foundation
 
class TuringVM {
    var ttuplesArray: [TTuple]
    
    
    func tupleReport() -> String {
        return ttuplesArray.reduce("", {$0.description + "\n\($1.description)"})
    }
 
    func nakedTupleReport() -> String {
        var string = "cs ic ns oc di"
 
    //string += ttuplesArray.reduce("", {String($0.nakedTuple()) + String($1.nakedTuple())})
        for t in ttuplesArray {
            string += "\n"
            string += t.nakedTuple()
        }
 
  
        return string
    }
 
    init(ttuplesArray: [TTuple]) {
        self.ttuplesArray = ttuplesArray
        numberTuples = ttuplesArray.count
    }
 
    private(set) var numberTuples : Int
 
    func tapeAsString(_ splitTape: [String], _ index: Int) -> String {
        var intermediateTape = ""
        for a in 0..<index {
            intermediateTape += splitTape[a]
        }
        intermediateTape += "[\(splitTape[index])]"
        for b in (index + 1)..<splitTape.count {
            intermediateTape += splitTape[b]
        }
        return intermediateTape
    }
 
    func runTuring(initialTape: String, initialState: Int, initialHead: Int) -> (numberSteps: Int, finalTape: String, trace: [String]) {
        var state = initialState
        var numberSteps = 0
        var index = initialHead
        var finding = true
        var splitTape = [String]()
        for i in initialTape {
            splitTape += [String(i)]
        }
        var keys = [String]()
        for i in ttuplesArray {
            keys += [(i.getKey())]
        }
        var trace = [String]()
 
 
   // The ttuples Array are the rules
  
        while finding {
            let key = "\(state) \(splitTape[index])"
            if keys.contains(key) {
                for i in ttuplesArray {
                    if i.getKey() == key {
                        state = i.newState
 
                        splitTape[index] = String(i.outputChar)
                        switch i.direction {
                        case .right : index += 1
                        case .left : index -= 1
                    }
 
                    numberSteps += 1
 
                    trace += ["\(numberSteps):  \(i.description) \(tapeAsString(splitTape, index))"]
      
                    }
                }
            }
            else {
                finding = false
            }
        }
 
 
        var finalTape = ""
        for i in splitTape {
            finalTape += i
        }
 
        return (numberSteps: numberSteps, finalTape: finalTape, trace: trace)
    }
}
