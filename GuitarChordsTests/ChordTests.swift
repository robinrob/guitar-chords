//
//  GuitarChordsTests.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 10/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class ChordTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCMajorChord() {
        let chord = Chord(ofType: ChordType.cMajor)
        
        let notes = chord.notes
        
        assert(notes == [Note.c, Note.e, Note.g])
    }
    
    func testDMajorChord() {
        let chord = Chord(ofType: ChordType.dMajor)
        
        let notes = chord.notes
        
        assert(notes == [Note.d, Note.fSharp, Note.a])
    }
    
    func testEMajorChord() {
        let chord = Chord(ofType: ChordType.eMajor)
        
        let notes = chord.notes
        
        assert(notes == [Note.e, Note.gSharp, Note.b])
    }
    
    func testFMajorChord() {
        let chord = Chord(ofType: ChordType.fMajor)
        
        let notes = chord.notes
        
        assert(notes == [Note.f, Note.a, Note.c])
    }
    
    func testGMajorChord() {
        let chord = Chord(ofType: ChordType.gMajor)
        
        let notes = chord.notes
        
        assert(notes == [Note.g, Note.b, Note.d])
    }
    
    func testAMajorChord() {
        let chord = Chord(ofType: ChordType.aMajor)
        
        let notes = chord.notes
        
        assert(notes == [Note.a, Note.cSharp, Note.e])
    }
    
    func TestChord() {
        let chord = Chord(ofType: ChordType.bMajor)
        
        let notes = chord.notes
        
        assert(notes == [Note.b, Note.dSharp, Note.fSharp])
    }
}
