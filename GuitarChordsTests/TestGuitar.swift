//
//  TestGuitar.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 07/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class TestGuitar: XCTestCase {
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
    
    func testShouldGetE1String() {
        let string = self.guitar!.getString(byType: GuitarStringType.one)
        
        assert(GuitarStringType.one == string.type)
    }
    
    func testShouldGetAString() {
        let string = self.guitar!.getString(byType: GuitarStringType.two)
        
        assert(GuitarStringType.two == string.type)
    }
    
    func testShouldFind0FingerPatternsForCMajorChordWithFretWidth0() {
        let patterns = self.guitar!.findFingerPatterns(ofChordType: ChordType.cMajor, withFretWidth: 0)
        
        assert(patterns.count == 0)
    }
    
    func testShouldFind0FingerPatternsForCMajorChordWithFretWidth1() {
        let patterns = self.guitar!.findFingerPatterns(ofChordType: ChordType.cMajor, withFretWidth: 1)
        
        assert(patterns.count == 0)
    }
    
    func testShouldFind2FingerPatternsForCMajorChordWithFretWidth3InFirst3Frets() {
        let patterns = self.guitar!.findFingerPatterns(ofChordType: ChordType.cMajor, withFretWidth: 3, fromFret: 0, toFret: 3)
        
        assert(patterns.count == 2)
    
        for pattern in patterns {
            assert(pattern.isChord(ChordType.cMajor))
        }
        
        var pattern = patterns[0]
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.one).isMuted)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.two).fret!.fretNum == 3)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.three).fret!.fretNum == 2)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.four).isOpenString)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.five).fret!.fretNum == 1)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.six).isOpenString)
        
        pattern = patterns[1]
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.one).isMuted)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.two).fret!.fretNum == 3)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.three).fret!.fretNum == 2)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.four).isOpenString)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.five).fret!.fretNum == 1)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.six).fret!.fretNum == 3)
    }
    
    func testShouldFind4FingerPatternsForCMajorChordWithFretWidth3InAllFrets() {
        let patterns = self.guitar!.findFingerPatterns(ofChordType: ChordType.cMajor, withFretWidth: 3)
        
        assert(patterns.count == 6)
        
        for pattern in patterns {
            assert(pattern.isChord(ChordType.cMajor))
        }
    }
}
