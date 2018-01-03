//
//  ChordSaver.swift
//  GuitarChords
//
//  Created by  Robin Smith on 31/12/2017.
//  Copyright © 2017 Robin Smith. All rights reserved.
//

import Foundation

class ChordSaver {
    func installChordPatterns() {
        print("CALCULATING FINGER PATTERNS ...")
        ChordFingerPattern.deleteAll()
        for tuning in GuitarTuning.all {
//        for tuning in [GuitarTuning.standard] {
            print("tuning: \(tuning)")
            let guitar = Guitar(withTuning: tuning)
            
            for chordType in ChordDictionary.getAllChordTypes() {
//              for chordType in [ChordType.aMajor, ChordType.aMinor] {
                print("chordType: \(chordType)")
                let fingerPatterns = guitar.findAllFingerPatterns(ofChordType: chordType, withMaxFretWidth: 3)
                for fingerPattern in fingerPatterns {
                    ChordFingerPattern.insertFromFingerPattern(chordType: chordType, fingerPattern: fingerPattern, guitarTuning: tuning)
                }
            }
        }
        Database.save()
    }
}
