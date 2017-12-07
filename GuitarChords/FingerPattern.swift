//
//  ChordPattern.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

class FingerPattern: CustomStringConvertible, Equatable {
    let fingerPositions: [FingerPosition]
    let description: String
    
    init(fingerPositions: [FingerPosition]) {
        self.fingerPositions = fingerPositions
        
        var strs: [String] = []
        for pos in self.fingerPositions {
            let fretString: String
            if !pos.isMuted {
                fretString = "fret \(pos.fret!.fretNum)"
            } else {
                fretString = "muted"
            }
            
            strs.append("\(fretString) on \(pos.guitarString.type) string")
        }
        self.description = strs.joined(separator: ", ")
    }
    
    var notes: [Note] {
        return fingerPositions.filter({ $0.isMuted == false }).map({ $0.note! })
    }
    
    func isChord(chordType: ChordType) -> Bool {
        return Chord(withNotes: self.notes) == ChordDictionary.getChord(ofType: chordType)
    }
    
    func getFingerPosition(byStringType stringType: GuitarStringType) -> FingerPosition {
        return self.fingerPositions.filter( {$0.guitarString.type == stringType })[0]
    }
    
    static func ==(lhs: FingerPattern, rhs: FingerPattern) -> Bool {
        return lhs.description == rhs.description
//        if lhs.fingerPositions.count == rhs.fingerPositions.count {
//            for (index, _) in lhs.fingerPositions.enumerated() {
//                if rhs.fingerPositions[index] != lhs.fingerPositions[index] {
//                    return false
//                }
//            }
//            return true
//        }
//        return false
    }
}
