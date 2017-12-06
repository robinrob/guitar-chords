//
//  NoteTest.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

import XCTest
@testable import GuitarChords

class TestNote: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldAdvanceNoteBy0Semitones() {
        var note = Note.c
        
        note = note.advanced(bySemiTones: 0)
        
        assert(note == Note.c)
    }
    
    func testShouldAdvanceNoteBy1Semitones() {
        var note = Note.c
        
        note = note.advanced(bySemiTones: 1)
        
        assert(note == Note.cSharp)
    }
    
    func testShouldAdvanceNoteBy5Semitones() {
        var note = Note.c
        
        note = note.advanced(bySemiTones: 5)
        
        assert(note == Note.f)
    }
    
    func testShouldAdvanceNoteBy5SemitonesAndLoopBack() {
        var note = Note.f
        
        note = note.advanced(bySemiTones: 5)
        
        assert(note == Note.aSharp)
    }
    
    func testShouldAdvanceNoteBy12SemitonesAndBeSameNote() {
        var note = Note.f
        
        note = note.advanced(bySemiTones: 12)
        
        assert(note == Note.f)
    }
}

