//
//  GuitarStringTest.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class TestGuitarString: XCTestCase {
    let guitar = Guitar()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldReturnCorrectBaseNoteForE1String() {
        let eString = GuitarString(onGuitar: self.guitar, ofType: GuitarStringType.e1)
        
        let baseNote = eString.baseNote
        
        assert(baseNote == Note.e)
    }
    
    func testShouldReturnCorrectBaseNoteForAString() {
        let eString = GuitarString(onGuitar: self.guitar, ofType: GuitarStringType.a)
        
        let baseNote = eString.baseNote
        
        assert(baseNote == Note.a)
    }
    
    func testShouldReturnCorrectBaseNoteForDString() {
        let eString = GuitarString(onGuitar: self.guitar, ofType: GuitarStringType.d)
        
        let baseNote = eString.baseNote
        
        assert(baseNote == Note.d)
    }
    
    func testShouldReturnCorrectBaseNoteForGString() {
        let eString = GuitarString(onGuitar: self.guitar, ofType: GuitarStringType.g)
        
        let baseNote = eString.baseNote
        
        assert(baseNote == Note.g)
    }
    
    func testShouldReturnCorrectBaseNoteForBString() {
        let eString = GuitarString(onGuitar: self.guitar, ofType: GuitarStringType.b)
        
        let baseNote = eString.baseNote
        
        assert(baseNote == Note.b)
    }
    
    func testShouldReturnCorrectBaseNoteForE2String() {
        let eString = GuitarString(onGuitar: self.guitar, ofType: GuitarStringType.e2)
        
        let baseNote = eString.baseNote
        
        assert(baseNote == Note.e)
    }
    
    func testShouldReturnOpenStringFretAtFretNum0() {
        let eString = GuitarString(onGuitar: self.guitar, ofType: GuitarStringType.e1)
        
        let fret = eString.getFret(atFretNum: 0)
        
        assert(eString.baseNote == fret.note)
        assert(0 == fret.fretNum)
    }
    
    
    func testShouldReturnCorrectFretAtFretNum12() {
        let eString = GuitarString(onGuitar: self.guitar, ofType: GuitarStringType.e1)
        
        let fret = eString.getFret(atFretNum: 12)
        
        assert(eString.baseNote == fret.note)
        assert(12 == fret.fretNum)
    }
    
    func testShouldReturnCorrectFretAtFretNum14() {
        let eString = GuitarString(onGuitar: self.guitar, ofType: GuitarStringType.e1)
        
        let fret = eString.getFret(atFretNum: 14)
        
        assert(Note.fSharp == fret.note)
        assert(14 == fret.fretNum)
    }
}


