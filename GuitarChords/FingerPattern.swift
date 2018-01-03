//
//  ChordPattern.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

class FingerPattern: CustomStringConvertible, Equatable {
    var fingerPositions: [FingerPosition]
    var fretWidth: Int {
        get {
            let fretNums = self.fingerPositions.filter({$0.isMuted == false && $0.fretNum! > 0}).map {$0.fretNum!}
            if fretNums.count > 0 {
                return (fretNums.max()! - fretNums.min()!) + 1
            } else {
                return 0
            }
        }
    }
    
    var description: String {
        get {
            var strs: [String] = []
            for pos in self.fingerPositions {
                let fretString: String
                if !pos.isMuted {
                    fretString = "fret \(pos.fret!.fretNum)"
                } else {
                    fretString = "muted"
                }
                
                strs.append("\(fretString) on \(pos.guitarString.type.rawValue) string")
            }
            return strs.joined(separator: ", ")
        }
    }
    
    var notes: [Note] {
        return self.fingerPositions.filter({ $0.isMuted == false }).map({ $0.note! })
    }
    
    var fretNums: [Int] {
        return self.fingerPositions.filter({$0.isMuted == false && $0.fretNum! > 0}).map {$0.fretNum!}
    }
    
    var averageFretNum: Float {
        return Float(self.fretNums.reduce(0, +)) / Float(fretNums.count)
    }
    
//    var stringFrets -> [StringFret] {
//        var stringFrets: [StringFret] = []
//        for pos in self.getUnMutedPositions() {
//            if pos.fret != nil {
//                stringFrets.append(StringFret(pos.fret!.string.type, pos.fret!.fretNum))
//            }
//        }
//        return stringFrets
//    }
    
    init(fingerPositions: [FingerPosition]) {
        self.fingerPositions = fingerPositions
    }
    
    func isChord(_ chordType: ChordType) -> Bool {
        return Chord(withNotes: self.notes) == ChordDictionary.getChord(ofType: chordType)
    }
    
    func getFingerPosition(byStringType stringType: GuitarStringType) -> FingerPosition {
        return self.fingerPositions.filter( {$0.guitarString.type == stringType })[0]
    }
    
    func mutePosition(positionNum: Int) {
        self.fingerPositions[positionNum].mute()
    }
    
    func unmutePositionIfOnFret(positionNum: Int) {
        self.fingerPositions[positionNum].unmuteIfFretPosition()
    }
    
    func hasMutedFretPositions() -> Bool {
        return self.fingerPositions.filter({$0.fret != nil && $0.isMuted}).count > 0
    }
    
    func getUnMutedPattern() -> FingerPattern {
        let newPattern = FingerPattern(fingerPositions: self.fingerPositions)
        for (index, _) in newPattern.fingerPositions.enumerated() {
            newPattern.unmutePositionIfOnFret(positionNum: index)
        }
        return newPattern
    }
    
    func getMutedPositions() -> [FingerPosition] {
        return self.fingerPositions.filter({$0.isMuted})
    }
    
    func getUnMutedPositions() -> [FingerPosition] {
        return self.fingerPositions.filter({!$0.isMuted})
    }
    
    func isSubsetOf(_ other: FingerPattern) -> Bool {
        return self != other && Set<FingerPosition>(self.fingerPositions).isSubset(of: Set<FingerPosition>(other.fingerPositions))
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
    
    static func getGuitarFingerPatternsByChordTypeAndTuning(onGuitar guitar: Guitar, chordType: ChordType, guitarTuning: GuitarTuning) -> [FingerPattern] {
        return ChordFingerPattern.toFingerPatterns(
            onGuitar: guitar,
            chordFingerPatterns: ChordFingerPattern.getByChordTypeAndTuning(chordType: chordType, guitarTuning: guitarTuning)
        )
    }
}
