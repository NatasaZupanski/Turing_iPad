//
//  MainView.swift
//  Turing_iPad (iOS)
//
//  Created by Natasa Zupanski on 5/9/21.
//

import SwiftUI

struct MainView: View {
    @StateObject var turingData = TuringData(ttuples: [])
    //@State var text = ""
    //@State var isRight = true
    //@State var currentState = ""
    //@State var initialCharacter = ""
    //@State var newState = ""
    //@State var outputCharacter = ""
    @State var initialString = "_"
    
    var body: some View {
        VStack {
            // Will be putting the run and initial string here
            HStack {
                Text("Initial String: ")
                TextField(initialString, text: $initialString)
            }
        }.padding()
        .navigationBarItems(trailing: Button(action: runMachine) {
            Text("Run")
        }
        )
    }
    
    func runMachine() {
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
