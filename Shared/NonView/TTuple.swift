//
//  TTuple.swift
//  Turing_iPad (iOS)
//
//  Created by Natasa Zupanski on 4/30/21.
//

import Foundation

enum Direction {
  case left
  case right
}
 
struct TTuple : CustomStringConvertible, Equatable {
    let currentState: Int
    let inputChar: Character
    let newState: Int
    let outputChar: Character
    let direction : Direction
 
    static func makeKey(state: Int, inputChar: Character) -> String {
   // Key is the state and input character
        return "\(state) \(inputChar)"
    }
    
    func getKey() -> String {
        return "\(currentState) \(inputChar)"
    }
 
    init(currentState: Int, inputChar: Character, newState: Int, outputChar: Character, direction: Direction) {
        self.currentState = currentState
        self.inputChar = inputChar
        self.newState = newState
        self.outputChar = outputChar
        self.direction = direction
    }
 
    var description: String {
        return "{cs: \(currentState) ic: \(inputChar) ns: \(newState) oc: \(outputChar) di: \(direction)}"
    }
 
    var tupleString: String {
        return "\(currentState) \(inputChar) \(newState) \(outputChar) \(direction)"
    }
 
    func nakedTuple() -> String {
        var directionString : String {
            switch direction {
            case .right : return "r"
            case .left : return "l"
            }
        }
        return "\(currentState)  \(inputChar)  \(newState)  \(outputChar)  \(directionString)"
    }
 
}

