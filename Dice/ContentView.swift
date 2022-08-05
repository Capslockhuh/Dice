//
//  ContentView.swift
//  Dice
//
//  Created by Jan Andrzejewski on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var rolledNumber = 0
    @StateObject var rolls = Rolls()
    @State private var diceSides = 6
    @State private var numberOfRolls = 0
    @State private var feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Stepper("Dice sides: \(diceSides)", value: $diceSides, step: 1)
                        .accessibilityLabel("Number of dice's sides")
                } header: {
                    Text("Number of dice's sides")
                }
                .accessibilityHint("Current number \(diceSides)")
                
                Section {
                    Button("Roll") {
                        feedback.prepare()
                        rolledNumber = Int.random(in: 1...diceSides)
                        feedback.notificationOccurred(.success)
                        let roll = Roll(id: UUID(), number: rolledNumber)
                        rolls.rolledNumbers.append(roll)
                        numberOfRolls += 1
                        rolls.save()
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                }
                
                Section {
                    Text("Current Number: \(rolledNumber)")
                        .font(.headline)
                        .disabled(rolledNumber == 0)
                }
                
                Section {
                    Text("You rolled the dice \(numberOfRolls) times")
                    Button("Delete history") {
                        feedback.prepare()
                        numberOfRolls = 0
                        rolls.rolledNumbers = []
                        feedback.notificationOccurred(.error)
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                    Text("Rolling history: ")
                        .font(.headline)
                    ForEach(rolls.rolledNumbers) { num in
                        Text("\(num.number)")
                    }
                }
            }
            .navigationTitle("Dice")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
