//
//  GuitarFretTest.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class TestGuitarFret: XCTestCase {
    let guitar = Guitar()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldReturnBaseNoteFor0thFret() {
        let e1String = Mocks.createE1String()
        let fret = GuitarFret(onString: e1String, fretNum: 0)
        
        let note = fret.note
        
        assert(note == e1String.baseNote)
    }
    
    func testShouldReturnNote1SemitoneAboveBaseNoteFor1stFret() {
        let e1String = Mocks.createE1String()
        let fret = GuitarFret(onString: e1String, fretNum: 1)
        
        let note = fret.note
        
        assert(note == Note.f)
    }
    
    func testShouldReturnNote5SemitonesAboveBaseNoteFor5thtFret() {
        let e1String = Mocks.createE1String()
        let fret = GuitarFret(onString: e1String, fretNum: 5)
        
        let note = fret.note
        
        assert(note == Note.a)
    }
    
    func testShouldReturnNote1OctaveAboveBaseNoteFor12thtFret() {
        let e1String = Mocks.createE1String()
        let fret = GuitarFret(onString: e1String, fretNum: 12)
        
        let note = fret.note
        
        assert(note == Note.e)
    }
    
    func testShouldReturnCorrectNoteFor14thtFret() {
        let e1String = Mocks.createE1String()
        let fret = GuitarFret(onString: e1String, fretNum: 14)
        
        let note = fret.note
        
        assert(note == Note.fSharp)
    }
}
