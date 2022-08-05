//
//  DiceTypes.swift
//  Dice
//
//  Created by Jan Andrzejewski on 05/08/2022.
//

import Foundation

struct Roll: Identifiable {
    let id = UUID()
    var number: Int
}

class Rolls: ObservableObject {
    @Published var rolledNumbers = [Roll]()
}
