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
    
    @State private var displayAlert: Bool = false
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
        .alert(alertTitle, isPresented: $displayAlert) {
            Button("OK", role: .cancel, action: newGame)
        } message: {
            Text(alertMessage)
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
        
        displayAlert.toggle()
        
    }
    
    func newGame() {
        userResponse = 0
        firstNumber = Int.random(in: 1...9)
        secondNumber = Int.random(in: 1...9)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
