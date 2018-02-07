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

class TestFingerPatternData: XCTestCase {
    private var guitar: Guitar?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.guitar = Guitar()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        ChordFingerPattern.deleteAll()
        Database.save()
    }
    
    func testShouldInsertChordFingerPattern() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: .one)),
                FingerPosition(atFret: self.guitar!.getString(byType: .two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: .three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: .four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: .five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: .six).getFret(atFretNum: 0))
            ]
        )
        
        let chordFingerPattern = ChordFingerPattern.insertFromFingerPattern(chordType: .cMajor, fingerPattern: fingerPattern, guitarTuning: .standard)
        
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
                FingerPosition(mutingString: self.guitar!.getString(byType: .one)),
                FingerPosition(atFret: self.guitar!.getString(byType: .two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: .three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: .four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: .five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: .six).getFret(atFretNum: 0))
            ]
        )
        
        ChordFingerPattern.insertFromFingerPattern(chordType: .cMajor, fingerPattern: fingerPattern, guitarTuning: .standard)
        
        let chordFingerPatterns = ChordFingerPattern.getByChordTypeAndTuning(chordType: .cMajor, guitarTuning: .standard)
        
        assert(chordFingerPatterns.count == 1)
    }
    
    func testShouldConvertToFingerPattern() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: .one)),
                FingerPosition(atFret: self.guitar!.getString(byType: .two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: .three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: .four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: .five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: .six).getFret(atFretNum: 0))
            ]
        )
        
        let chordFingerPattern = ChordFingerPattern.insertFromFingerPattern(chordType: .cMajor, fingerPattern: fingerPattern, guitarTuning: .standard)
        
        let convertedFingerPattern = chordFingerPattern.toFingerPattern(onGuitar: self.guitar!)
        
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
