//
//  Guitar.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


class Guitar {
    var withFrets: Int
    var strings: [GuitarString]
    
    init(withFrets: Int) {
        self.withFrets = withFrets
        
        self.strings = [
            GuitarString(withBaseNote: Note.e),
            GuitarString(withBaseNote: Note.a),
            GuitarString(withBaseNote: Note.d),
            GuitarString(withBaseNote: Note.g),
            GuitarString(withBaseNote: Note.b),
            GuitarString(withBaseNote: Note.e),
        ]
    }
    
    func findAllChordPatterns(ofType chordType: ChordType, fromFret: Int, toFret: Int) {
        let chord = Chord(ofType: chordType)
        var chordPatterns: [ChordPattern] = []
        
        var fingerPositions: [FingerPosition] = []
        for string in self.strings {
            for fretNum in fromFret...toFret {
                let fret = string.getFret(atFretNum: fretNum)
                if chord.notes.contains(fret.note) {
                    fingerPositions.append(FingerPosition(fret: fret))
                } else {
                    fingerPositions.append(FingerPosition(fret: nil))
                }
            }
        }
        
        if fingerPositions.filter({ $0.isMuted }).count > 2 {
            chordPatterns.append(ChordPattern(fingerPositions: fingerPositions))
        }
    }
}
