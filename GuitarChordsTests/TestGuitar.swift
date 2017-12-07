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
        let string = self.guitar!.getString(byType: GuitarStringType.e1)
        
        assert(GuitarStringType.e1 == string.type)
    }
    
    func testShouldGetAString() {
        let string = self.guitar!.getString(byType: GuitarStringType.a)
        
        assert(GuitarStringType.a == string.type)
    }
    
    func testShouldFindAllFingerPatternsForCMajorChordInFirst3Frets() {
        let patterns = self.guitar!.findAllFingerPatterns(ofChordType: ChordType.cMajor, withFretWidth: 3)
        
        assert(patterns.count == 2)
        
        for pattern in patterns {
            assert(pattern.isChord(chordType: ChordType.cMajor))
        }
        
        var pattern = patterns[0]
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.e1).isMuted)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.a).fret!.fretNum == 3)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.d).fret!.fretNum == 2)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.g).isOpenString)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.b).fret!.fretNum == 1)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.e2).isOpenString)
        
        pattern = patterns[1]
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.e1).isMuted)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.a).fret!.fretNum == 3)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.d).fret!.fretNum == 2)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.g).isOpenString)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.b).fret!.fretNum == 1)
        assert(pattern.getFingerPosition(byStringType: GuitarStringType.e2).fret!.fretNum == 3)
    }
}
