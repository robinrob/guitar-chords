//
//  TestChordFingerPattern.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 01/01/2018.
//  Copyright © 2018 Robin Smith. All rights reserved.
//

import XCTest
import CoreData
@testable import GuitarChords

class TestChordFingerPatternDAO: XCTestCase {
    private var dao = ChordFingerPatternDAO()
    private var guitar = Guitar()
    
    override func tearDown() {
        super.tearDown()
        
        ChordFingerPatternDAO().deleteAll()
    }
    
    func testShouldInsertChordFingerPattern() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar.getString(byType: .one)),
                FingerPosition(atFret: self.guitar.getString(byType: .two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar.getString(byType: .three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar.getString(byType: .four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar.getString(byType: .five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar.getString(byType: .six).getFret(atFretNum: 0))
            ]
        )
        
        let chordFingerPattern = self.dao.insertFromFingerPattern(
            fingerPattern: fingerPattern,
            chordType: .cMajor,
            guitarTuning: .standard
        )
        
        assert(chordFingerPattern.chord_name == "C Major")
        assert(chordFingerPattern.guitar_tuning == "Standard")
        assert(chordFingerPattern.string_1_fret == -1)
        assert(chordFingerPattern.string_2_fret == 3)
        assert(chordFingerPattern.string_3_fret == 2)
        assert(chordFingerPattern.string_4_fret == 0)
        assert(chordFingerPattern.string_5_fret == 1)
        assert(chordFingerPattern.string_6_fret == 0)
    }
    
    func testGetChordFingerPatterns() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar.getString(byType: .one)),
                FingerPosition(atFret: self.guitar.getString(byType: .two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar.getString(byType: .three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar.getString(byType: .four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar.getString(byType: .five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar.getString(byType: .six).getFret(atFretNum: 0))
            ]
        )
        
        self.dao.insertFromFingerPattern(
            fingerPattern: fingerPattern,
            chordType: .cMajor,
            guitarTuning: .standard
        )
        
        let chordFingerPatterns = self.dao.getByChordTypeAndTuning(chordType: .cMajor, guitarTuning: .standard)
        
        assert(chordFingerPatterns.count == 1)
    }
    
    func testShouldConvertToFingerPattern() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar.getString(byType: .one)),
                FingerPosition(atFret: self.guitar.getString(byType: .two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar.getString(byType: .three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar.getString(byType: .four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar.getString(byType: .five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar.getString(byType: .six).getFret(atFretNum: 0))
            ]
        )
        
        let chordFingerPattern = self.dao.insertFromFingerPattern(
            fingerPattern: fingerPattern,
            chordType: .cMajor,
            guitarTuning: .standard
        )
        
        let convertedFingerPattern = chordFingerPattern.toFingerPattern(onGuitar: self.guitar)
        
        assert(convertedFingerPattern == fingerPattern)
    }
}

