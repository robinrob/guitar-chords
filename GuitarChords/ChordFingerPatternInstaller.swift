//
//  ChordSaver.swift
//  GuitarChords
//
//  Created by  Robin Smith on 31/12/2017.
//  Copyright © 2017 Robin Smith. All rights reserved.
//

import Foundation

class ChordFingerPatternInstaller {
    func installChordPatterns() {
        print("CALCULATING FINGER PATTERNS ...")
        ChordFingerPatternDAO().deleteAll()
//        var fingerPattern: FingerPattern[]
        
        for tuning in GuitarTuning.all {
//        for tuning in [GuitarTuning.standard] {
            print("tuning: \(tuning)")
            let guitar = Guitar(withTuning: tuning)
            
            for chordType in ChordDictionary.getAllChordTypes() {
//              for chordType in [ChordType.aMajor, ChordType.aMinor] {
                print("chordType: \(chordType)")
                let fingerPatterns = ChordChordFingerPatternGenerator().findAllFingerPatterns(
                    onGuitar: guitar,
                    ofChordType: chordType,
                    withMaxFretWidth: 3
                )
                for fingerPattern in fingerPatterns {
                    ChordFingerPatternDAO().insertFromFingerPattern(
                        fingerPattern: fingerPattern,
                        chordType: chordType,
                        guitarTuning: tuning
                    )
                }
            }
        }
        Database.save()
    }
}
