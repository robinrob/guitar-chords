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
        var fingerPositionsByString: [[FingerPosition]] = []
        for string in strings {
            var fingerPositions: [FingerPosition] = []
            for fretNum in 1...4 {
                fingerPositions.append(FingerPosition(atFret: string.getFret(atFretNum: fretNum)))
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
