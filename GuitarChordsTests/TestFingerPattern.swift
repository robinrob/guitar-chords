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
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 3)),
            ]
        )
        
        let notes = fingerPattern.notes
        
        assert(notes.count == 1)
        assert(notes[0] == Note.c)
    }
    
    func testShouldReturn0NotesWhenAllStringsMuted() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.two)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.three)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.four)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.five)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.six)),
            ]
        )
        
        let notes = fingerPattern.notes
        
        assert(notes.count == 0)
    }
    
    func testShouldReturnCorrectNotes() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.six).getFret(atFretNum: 0))
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
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.six).getFret(atFretNum: 0))
            ]
        )
        
        let isChord = fingerPattern.isChord(ChordType.cMajor)
        
        assert(isChord)
    }
    
    func testShouldNotBeEqualToCMajorChordWhenItContainsAdditionalNotes() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.six).getFret(atFretNum: 2))
            ]
        )
        
        let isChord = fingerPattern.isChord(ChordType.cMajor)
        
        assert(!isChord)
    }
    
    func testShouldReturnFingerPositionsByStringType() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.six).getFret(atFretNum: 0))
            ]
        )
        
        var pos = fingerPattern.getFingerPosition(byStringType: GuitarStringType.one)
        assert(GuitarStringType.one == pos.guitarString.type)
        assert(pos.isMuted)
        
        pos = fingerPattern.getFingerPosition(byStringType: GuitarStringType.five)
        assert(GuitarStringType.five == pos.guitarString.type)
        assert(1 == pos.fret?.fretNum)
        
        pos = fingerPattern.getFingerPosition(byStringType: GuitarStringType.six)
        assert(GuitarStringType.six == pos.guitarString.type)
        assert(pos.isOpenString)
    }
    
    func testShouldBe1FretWideWithOnePosition() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 3)),
                ]
        )
        
        assert(1 == fingerPattern.fretWidth)
    }
    
    func testShouldBe3FretsWideForCMajorChord() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 3)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.three).getFret(atFretNum: 2)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.four).getFret(atFretNum: 0)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.five).getFret(atFretNum: 1)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.six).getFret(atFretNum: 0))
            ]
        )
        
        assert(3 == fingerPattern.fretWidth)
    }
    
    func testShouldBe0FretsWideWhenAllStringsMuted() {
        let fingerPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.two)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.three)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.four)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.five)),
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.six))
            ]
        )
        
        assert(0 == fingerPattern.fretWidth)
    }
    
    func testShouldUnmuteMutedFretPositions() {
        let aMajorPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 12)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.three).getFret(atFretNum: 14)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.four).getFret(atFretNum: 14)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.five).getFret(atFretNum: 14)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.six).getFret(atFretNum: 12))
            ]
        )
        assert(aMajorPattern.getMutedPositions().count == 1)
        assert(aMajorPattern.isChord(ChordType.aMajor))
        
        aMajorPattern.mutePosition(positionNum: 1)
        aMajorPattern.mutePosition(positionNum: 2)
        assert(aMajorPattern.getMutedPositions().count == 3)
        assert(aMajorPattern.isChord(ChordType.aMajor))
        
        let unmutedAMajor = aMajorPattern.getUnMutedPattern()
        assert(unmutedAMajor.getMutedPositions().count == 1)
        assert(unmutedAMajor.isChord(ChordType.aMajor))
    }
    
    func testShouldConvertToJSON() {
        let aMajorPattern = FingerPattern(
            fingerPositions: [
                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 12)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.three).getFret(atFretNum: 14)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.four).getFret(atFretNum: 14)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.five).getFret(atFretNum: 14)),
                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.six).getFret(atFretNum: 12))
            ]
        )
        
        let json = aMajorPattern.toJSON()
        
        assert("" == json)
    }
    
//    func testShouldBeSubsetOfOtherPattern() {
//        let patternA = FingerPattern(
//            fingerPositions: [
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 3)),
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 1)),
//                ]
//        )
//
//        let patternB = FingerPattern(
//            fingerPositions: [
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 3)),
//                FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.two)),
//                ]
//        )
//
//        assert(patternB.isSubsetOf(patternA))
//    }
//
//    func testShouldNotBeSubsetOfOtherPatternWhenEqual() {
//        let patternA = FingerPattern(
//            fingerPositions: [
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 3)),
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 1)),
//                ]
//        )
//
//        let patternB = FingerPattern(
//            fingerPositions: [
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 3)),
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 1)),
//                ]
//        )
//
//        assert(!patternB.isSubsetOf(patternA))
//    }
//
//    func testShouldNotBeSubsetOfOtherPatternWhenHasDifferentFretPositions() {
//        let patternA = FingerPattern(
//            fingerPositions: [
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 3)),
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 1)),
//                ]
//        )
//
//        let patternB = FingerPattern(
//            fingerPositions: [
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 3)),
//                FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 2)),
//                ]
//        )
//
//        assert(!patternB.isSubsetOf(patternA))
//    }
}
