//
//  ContentView.swift
//  Dice
//
//  Created by Jan Andrzejewski on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var rolledNumber = 0
    var body: some View {
        NavigationView {
            List {
                Button("Roll") {
                    rolledNumber = Int.random(in: 1...6)
                }
                
                Text("Number: \(rolledNumber)")
                    .font(.title)
                    .disabled(rolledNumber == 0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
