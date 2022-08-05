//
//  FileManager-DocumentsDirectory.swift
//  Dice
//
//  Created by Jan Andrzejewski on 05/08/2022.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
