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
    var guitar: Guitar?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.guitar = Guitar()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShouldReturnCorrectBaseNoteForE1String() {
        let string = self.guitar!.getString(byType: GuitarStringType.e1)
        
        let baseNote = string.baseNote
        
        assert(baseNote == Note.e)
    }
    
    func testShouldReturnCorrectBaseNoteForAString() {
        let string = self.guitar!.getString(byType: GuitarStringType.a)
        
        let baseNote = string.baseNote
        
        assert(baseNote == Note.a)
    }
    
    func testShouldReturnCorrectBaseNoteForDString() {
        let string = self.guitar!.getString(byType: GuitarStringType.d)
        
        let baseNote = string.baseNote
        
        assert(baseNote == Note.d)
    }
    
    func testShouldReturnCorrectBaseNoteForGString() {
        let string = self.guitar!.getString(byType: GuitarStringType.g)
        
        let baseNote = string.baseNote
        
        assert(baseNote == Note.g)
    }
    
    func testShouldReturnCorrectBaseNoteForBString() {
        let string = self.guitar!.getString(byType: GuitarStringType.b)
        
        let baseNote = string.baseNote
        
        assert(baseNote == Note.b)
    }
    
    func testShouldReturnCorrectBaseNoteForE2String() {
        let string = self.guitar!.getString(byType: GuitarStringType.e2)
        
        let baseNote = string.baseNote
        
        assert(baseNote == Note.e)
    }
    
    func testShouldReturnOpenStringFretAtFretNum0() {
        let string = self.guitar!.getString(byType: GuitarStringType.e1)
        
        let fret = string.getFret(atFretNum: 0)
        
        assert(string.baseNote == fret.note)
        assert(0 == fret.fretNum)
    }
    
    
    func testShouldReturnCorrectFretAtFretNum12() {
        let string = self.guitar!.getString(byType: GuitarStringType.e1)
        
        let fret = string.getFret(atFretNum: 12)
        
        assert(string.baseNote == fret.note)
        assert(12 == fret.fretNum)
    }
    
    func testShouldReturnCorrectFretAtFretNum14() {
        let string = self.guitar!.getString(byType: GuitarStringType.e1)
        
        let fret = string.getFret(atFretNum: 14)
        
        assert(Note.fSharp == fret.note)
        assert(14 == fret.fretNum)
    }
}


