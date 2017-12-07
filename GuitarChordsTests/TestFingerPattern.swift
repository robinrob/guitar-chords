//
//  FingerPatternTest.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class TestFingerPattern: XCTestCase {
    var guitar: Guitar?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.guitar = Guitar()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldReturnSingleCNote() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.a).getFret(atFretNum: 3)),
            ]
        )
        
        let notes = fingerPattern.notes
        
        assert(notes.count == 1)
        assert(notes[0] == Note.c)
    }
    
    func testShouldReturn0NotesWhenAllStringsMuted() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e1)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.a)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.d)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.g)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.b)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e2)),
            ]
        )
        
        let notes = fingerPattern.notes
        
        assert(notes.count == 0)
    }
    
    func testShouldReturnCorrectNotes() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.a).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.d).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.g).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.b).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.e2).getFret(atFretNum: 0))
            ]
        )
        
        let notes = fingerPattern.notes
        
        assert(notes.count == 5)
        assert(notes[0] == Note.c)
        assert(notes[1] == Note.e)
        assert(notes[2] == Note.g)
        assert(notes[3] == Note.c)
        assert(notes[4] == Note.e)
    }
    
    func testShouldBeEqualToCMajorChord() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.a).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.d).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.g).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.b).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.e2).getFret(atFretNum: 0))
            ]
        )
        
        let isChord = fingerPattern.isChord(chordType: ChordType.cMajor)
        
        assert(isChord)
    }
    
    func testShouldNotBeEqualToCMajorChordWhenItContainsAdditionalNotes() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.a).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.d).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.g).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.b).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.e2).getFret(atFretNum: 2))
            ]
        )
        
        let isChord = fingerPattern.isChord(chordType: ChordType.cMajor)
        
        assert(!isChord)
    }
    
    func testShouldReturnFingerPositionsByStringType() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.a).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.d).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.g).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.b).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.e2).getFret(atFretNum: 0))
            ]
        )
        
        var pos = fingerPattern.getFingerPosition(byStringType: GuitarStringType.e1)
        assert(GuitarStringType.e1 == pos.guitarString.type)
        assert(pos.isMuted)
        
        pos = fingerPattern.getFingerPosition(byStringType: GuitarStringType.b)
        assert(GuitarStringType.b == pos.guitarString.type)
        assert(1 == pos.fret?.fretNum)
        
        pos = fingerPattern.getFingerPosition(byStringType: GuitarStringType.e2)
        assert(GuitarStringType.e2 == pos.guitarString.type)
        assert(pos.isOpenString)
    }
    
    func testShouldBe1FretWideWithOnePosition() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.a).getFret(atFretNum: 3)),
                ]
        )
        
        assert(1 == fingerPattern.fretWidth)
    }
    
    func testShouldBe3FretsWideForCMajorChord() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.a).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.d).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.g).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.b).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.e2).getFret(atFretNum: 0))
            ]
        )
        
        assert(3 == fingerPattern.fretWidth)
    }
    
    func testShouldBe0FretsWideWhenAllStringsMuted() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e1)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.a)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.d)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.g)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.b)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e2))
            ]
        )
        
        assert(0 == fingerPattern.fretWidth)
    }
}
