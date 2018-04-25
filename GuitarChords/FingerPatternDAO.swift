//
//  ChordFingerPatternDAO.swift
//  GuitarChords
//
//  Created by Robin Smith on 07/02/2018.
//  Copyright © 2018 Robin Smith. All rights reserved.
//

import Foundation
import CoreData

class ChordFingerPatternDAO {
    init() {
        // load data from JSON
    }
    
    func toJSON(_ fingerPatterns: [FingerPattern]) -> String {
        return ""
    }
    
    func findByChordTypeAndTuning(
        onGuitar guitar: Guitar,
        chordType: ChordType,
        guitarTuning: GuitarTuning
        ) -> [FingerPattern] {
        return []
    }
}
