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
            GuitarString(ofType: GuitarStringType.e1, withBaseNote: Note.e),
            GuitarString(ofType: GuitarStringType.a,withBaseNote: Note.a),
            GuitarString(ofType: GuitarStringType.d,withBaseNote: Note.d),
            GuitarString(ofType: GuitarStringType.g,withBaseNote: Note.g),
            GuitarString(ofType: GuitarStringType.b,withBaseNote: Note.b),
            GuitarString(ofType: GuitarStringType.e2,withBaseNote: Note.e),
        ]
    }
    
    func findAllFingerPatterns(ofChordType chordType: ChordType, withFretWidth: Int = 4) -> [FingerPattern] {
        var fingerPositionsByString: [[FingerPosition]] = []
        for string in strings {
            var fingerPositions: [FingerPosition] = []
            for fretNum in 1...4 {
                fingerPositions.append(FingerPosition(fret: string.getFret(atFretNum: fretNum)))
            }
            fingerPositionsByString.append(fingerPositions)
        }
        
        let fingerPositionPossibilities = ArrayMultiplier<FingerPosition>().multiply(fingerPositionsByString)
        
        var fingerPatterns: [FingerPattern] = []
        for fingerPositionPossibility in fingerPositionPossibilities {
            let fingerPattern = FingerPattern(fingerPositions: fingerPositionPossibility)
            if fingerPattern.isChord(chordType: chordType) {
                fingerPatterns.append(fingerPattern)
            }
        }
        return fingerPatterns
    }
}
