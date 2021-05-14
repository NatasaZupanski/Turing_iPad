//
//  TuringData.swift
//  Turing_iPad (iOS)
//
//  Created by Natasa Zupanski on 5/9/21.
//

import Foundation

class TuringData : ObservableObject {
    @Published var machine : TuringVM
    @Published var tapes = [(numberSteps: Int, finalTape: String, trace: [String])]()
    
    init(ttuples: [TTuple]) {
        self.machine = TuringVM(ttuplesArray: ttuples)
    }
    
    func run(initialTape: String, initialState: Int, initialHead: Int) {
        self.tapes.append(self.machine.runTuring(initialTape: initialTape, initialState: initialState, initialHead: initialHead))
    }
    
    func update(ttuples: [TTuple]) {
        self.machine = TuringVM(ttuplesArray: ttuples)
    }
    
    /*var ttuples : [TTuple] {
        machine.ttuplesArray
    }*/
    
}
