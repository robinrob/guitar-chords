//
//  ChordType.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

enum ChordType: String {
    case cMajor = "C Major"
    case dMajor = "D Major"
    case eMajor = "E Major"
    case fMajor = "F Major"
    case gMajor = "G Major"
    case aMajor = "A Major"
    case bMajor = "B Major"
    
    static func getAllMajor() -> [ChordType] {
        return [
            ChordType.cMajor,
            ChordType.dMajor,
            ChordType.eMajor,
            ChordType.fMajor,
            ChordType.gMajor,
            ChordType.aMajor,
            ChordType.bMajor
        ]
    }
    
    static func getAllMajorNames() -> [String] {
        return self.getAllMajor().map {$0.rawValue}
    }
}
