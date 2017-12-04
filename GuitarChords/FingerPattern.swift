//
//  ChordPattern.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

class FingerPattern: CustomStringConvertible {
    let fingerPositions: [FingerPosition]
    let description: String
    
    init(fingerPositions: [FingerPosition]) {
        self.fingerPositions = fingerPositions
        
        var str = ""
        for pos in self.fingerPositions {
            str += "fret \(pos.fret!.fretNum) on string \(pos.fret!.string!.type)"
        }
        self.description = str
    }
    
    var notes: [Note] {
        return fingerPositions.reduce([], {
            res, pos in
            if !pos.isMuted {
                return res + [pos.note]
            } else {
                return res
            }
        })
    }
    
    func isChord(chordType: ChordType) -> Bool {
        let chordNotes = ChordDictionary.getNotesFor(chordType: chordType)
        return NSSet(array: chordNotes).isSubset(of: Set(self.notes))
    }
}
