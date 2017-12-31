//
//  ChordSaver.swift
//  GuitarChords
//
//  Created by  Robin Smith on 31/12/2017.
//  Copyright © 2017 Robin Smith. All rights reserved.
//

import Foundation

class ChordSaver {
    
    
    func installStandardChordPatterns() {
        for tuning in [GuitarTuning.standard] {
            let guitar = Guitar(withTuning: .standard)
            
            for chordType in ChordDictionary.getAllChordTypes() {
                let fingerPatterns = guitar.findAllFingerPatterns(ofChordType: chordType, withMaxFretWidth: 4)
                for fingerPattern in fingerPatterns {
                    ChordFingerPattern.insertFromFingerPattern(chordType: chordType, fingerPattern: fingerPattern, guitarTuning: tuning)
                }
            }
        }
    }
}
