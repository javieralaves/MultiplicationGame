//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by Javier Alaves on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userResponse: Int = 0
    @State private var firstNumber: Int = Int.random(in: 1...9)
    @State private var secondNumber: Int = Int.random(in: 1...9)
    
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("What's \(firstNumber) x \(secondNumber)?")
                        .fontWeight(.semibold)
                }
                Section ("Your answer") {
                    TextField("Answer", value: $userResponse, format: .number)
                }
                .keyboardType(.numberPad)
                
                Button("Submit", action: submitAnswer)
            }
        }
    }
    
    func submitAnswer() {
        
        let answer = firstNumber * secondNumber
        
        if userResponse == answer {
            alertTitle = "Well done!"
            alertMessage = "Your answer is correct."
        } else {
            alertTitle = "That's not it"
            alertMessage = "The right answer is \(answer)."
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
