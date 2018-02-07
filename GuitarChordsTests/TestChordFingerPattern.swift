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

class TestChordFingerPattern: XCTestCase {
    private var guitar = Guitar()

    
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
        
        let chordFingerPattern = ChordFingerPatternDAO().insertFromFingerPattern(
            fingerPattern: fingerPattern,
            chordType: .cMajor,
            guitarTuning: .standard
        )
        
        let convertedFingerPattern = chordFingerPattern.toFingerPattern(onGuitar: self.guitar)
        
        assert(convertedFingerPattern == fingerPattern)
    }
    
    func testShouldEncodeAsJSON() {
        let context = AppDelegate.persistentContainer.viewContext
        let chordFingerPattern = NSEntityDescription.insertNewObject(forEntityName: "ChordFingerPattern", into: context) as! ChordFingerPattern
        chordFingerPattern.chord_name = "test-chord"
        chordFingerPattern.guitar_tuning = "test-tuning"
        chordFingerPattern.string_1_fret = 1
        chordFingerPattern.string_2_fret = 2
        chordFingerPattern.string_3_fret = 3
        chordFingerPattern.string_4_fret = 4
        chordFingerPattern.string_5_fret = 5
        chordFingerPattern.string_6_fret = 6
        
        let json = chordFingerPattern.toJSON()
        print("json: \(json)")
        let expectedJSON = """
{
    "guitar_tuning": "test-tuning",
    "chord_name": "test-chord"
}
""".replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
        assert(json == expectedJSON)
    }
}
