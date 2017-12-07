//
//  Guitar.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


class Guitar {
    var numFrets: Int
    var strings: [GuitarString]
    
    init(withNumFrets numFrets: Int = 14) {
        self.numFrets = numFrets
    
        self.strings = []
        for stringType in GuitarStringType.all() {
            self.strings.append(GuitarString(onGuitar: self, ofType: stringType))
        }
    }
    
    func findAllFingerPatterns(ofChordType chordType: ChordType, withFretWidth: Int = 4) -> [FingerPattern] {
        let chord = Chord(ofType: chordType)
        var fingerPositionsByString: [[FingerPosition]] = []
        for string in self.strings {
            var fingerPositions: [FingerPosition] = []
            for fretNum in 0...3 {
                let fret = string.getFret(atFretNum: fretNum)
                if chord.notes.contains(fret.note) {
                    fingerPositions.append(FingerPosition(atFret: fret))
                }
            }
            fingerPositionsByString.append(fingerPositions)
        }
        
        let fingerPositionsPossibilities = ArrayMultiplier<FingerPosition>().multiply(fingerPositionsByString)
        
        var fingerPatterns: [FingerPattern] = []
        for fingerPositionsPossibility in fingerPositionsPossibilities {
            for pos in fingerPositionsPossibility {
                if (pos.note == chord.baseNote) {
                    break
                } else if pos.note != chord.baseNote {
                    pos.mute()
                }
            }
            
            let fingerPattern = FingerPattern(fingerPositions: fingerPositionsPossibility)
            if fingerPattern.isChord(chordType: chordType) && !fingerPatterns.contains(fingerPattern) {
                fingerPatterns.append(fingerPattern)
            }
        }
        return fingerPatterns
    }
    
    func getString(byType type: GuitarStringType) -> GuitarString {
        return self.strings.filter({ $0.type == type }).first!
    }
}
