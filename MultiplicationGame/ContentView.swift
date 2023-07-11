//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by Javier Alaves on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userResponse: String = "0"
    @State private var firstNumber: Int = Int.random(in: 1...9)
    @State private var secondNumber: Int = Int.random(in: 1...9)
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("What's \(firstNumber) x \(secondNumber)?")
                        .fontWeight(.semibold)
                }
                Section ("Your answer") {
                    TextField("Answer", text: $userResponse)
                }
                .keyboardType(.numberPad)
                
                Button("Submit", action: submitAnswer)
            }
        }
    }
    
    func submitAnswer() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
