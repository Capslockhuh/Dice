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
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button("Roll") {
                        rolledNumber = Int.random(in: 1...6)
                        let roll = Roll(number: rolledNumber)
                        rolls.rolledNumbers.append(roll)
                    }
                    .buttonStyle(.bordered)
                }
                
                Section {
                    Text("Current Number: \(rolledNumber)")
                        .font(.headline)
                        .disabled(rolledNumber == 0)
                }
                
                Section {
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
