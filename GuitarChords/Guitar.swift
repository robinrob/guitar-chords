//
//  Guitar.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


class Guitar {
    let numFrets: Int
    var strings: [GuitarString]
    static var defaultNumFrets = 14
    
    init(withNumFrets numFrets: Int = Guitar.defaultNumFrets) {
        self.numFrets = numFrets
    
        self.strings = []
        for stringType in GuitarStringType.all() {
            self.strings.append(GuitarString(onGuitar: self, ofType: stringType))
        }
    }
    
    func getString(byType type: GuitarStringType) -> GuitarString {
        return self.strings.filter({ $0.type == type }).first!
    }
    
    func findAllFingerPatterns(ofChordType chordType: ChordType, withMaxFretWidth fretWidth: Int = 4) -> [FingerPattern] {
        return self.findFingerPatterns(ofChordType: chordType, withFretWidth: fretWidth, fromFret: 0, toFret: self.numFrets)
    }
    
    func findFingerPatterns(ofChordType chordType: ChordType, withFretWidth fretWidth: Int = 4, fromFret: Int = 0, toFret: Int = Guitar.defaultNumFrets) -> [FingerPattern] {
        var fretRanges: [(Int, Int)] = []
        for fretNum in fromFret...toFret - fretWidth {
            fretRanges.append((fretNum, fretNum + fretWidth))
        }
        
        var fingerPatterns: [FingerPattern] = []
        for fretRange in fretRanges {
            fingerPatterns += self.findFingerPatternsInFretRange(
                ofChordType: chordType, withFretWidth: fretWidth, fromFret: fretRange.0, toFret: fretRange.1
            ).filter({!fingerPatterns.contains($0)})
        }
        return fingerPatterns
    }
    
    private func findFingerPatternsInFretRange(ofChordType chordType: ChordType, withFretWidth fretWidth: Int, fromFret: Int, toFret: Int) -> [FingerPattern] {
        let chord = Chord(ofType: chordType)
        var fingerPositionsByString: [[FingerPosition]] = []
        for string in self.strings {
            var fingerPositions: [FingerPosition] = []
            for fretNum in fromFret...toFret {
                let fret = string.getFret(atFretNum: fretNum)
                if chord.notes.contains(fret.note) {
                    fingerPositions.append(FingerPosition(atFret: fret))
                } else {
                    fingerPositions.append(FingerPosition(mutingString: string))
                }
            }
            fingerPositionsByString.append(fingerPositions)
        }
        
        let fingerPositionsPossibilities = ArrayMultiplier<FingerPosition>().multiply(fingerPositionsByString)
        
        var fingerPatterns: [FingerPattern] = []
        for fingerPositionsPossibility in fingerPositionsPossibilities {
            // Mute all strings before base note string
            let fingerPattern = FingerPattern(fingerPositions: fingerPositionsPossibility)
            for (index, pos) in fingerPattern.fingerPositions.enumerated() {
                if (pos.note == chord.baseNote) {
                    break
                } else if pos.note != chord.baseNote {
                    fingerPattern.mutePosition(positionNum: index)
                }
            }

            if !fingerPatterns.contains(fingerPattern) && self.fingerPatternSatisfiesCrietia(fingerPattern: fingerPattern, chordType: chordType, fretWidth: fretWidth) {
                fingerPatterns.append(fingerPattern)
            }
        }
        return fingerPatterns
    }
    
    private func fingerPatternSatisfiesCrietia(fingerPattern: FingerPattern, chordType: ChordType, fretWidth: Int) -> Bool {
        var matches = fingerPattern.isChord(chordType) && fingerPattern.notes.count >= 3 && fingerPattern.fretWidth <= fretWidth && !self.fingerPatternHasMutedStringsInMiddle(fingerPattern: fingerPattern)
        if fingerPattern.hasMutedFretPositions() {
            matches = matches && !fingerPattern.getUnMutedPattern().isChord(chordType)
        }
        return matches
    }
    
    private func fingerPatternHasMutedStringsInMiddle(fingerPattern: FingerPattern) -> Bool {
        var mutedStringIndices: [Int] = []
        for (index, pos) in fingerPattern.fingerPositions.enumerated() {
            if pos.isMuted {
                mutedStringIndices.append(index)
            }
        }
        
        if mutedStringIndices.count > 0 {
            return !Func.isSequence(ints: mutedStringIndices) || mutedStringIndices.first! > 0
        } else {
            return false
        }
    }
}
