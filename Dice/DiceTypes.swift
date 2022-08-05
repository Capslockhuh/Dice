//
//  DiceTypes.swift
//  Dice
//
//  Created by Jan Andrzejewski on 05/08/2022.
//

import Foundation
import SwiftUI

struct Roll: Identifiable, Codable {
    let id: UUID
    var number: Int
}

class Rolls: ObservableObject {
    @Published var rolledNumbers = [Roll]()
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedRolls")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            rolledNumbers = try JSONDecoder().decode([Roll].self, from: data)
        } catch {
            rolledNumbers = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(rolledNumbers)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Saving data has failed.")
        }
    }
}
