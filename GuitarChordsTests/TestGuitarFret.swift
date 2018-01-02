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
    
    func test0thFretOfEStringShouldBeE() {
        let string = self.guitar!.getString(byType: GuitarStringType.one)
        let fret = string.getFret(atFretNum: 0)
        
        let note = fret.note
        
        assert(note == Note.e)
    }
    
    func test1stFretOfEStringShouldBeF() {
        let string = self.guitar!.getString(byType: GuitarStringType.one)
        let fret = string.getFret(atFretNum: 1)
        
        let note = fret.note
        
        assert(note == Note.f)
    }
    
    func test5thFretOfEStringShouldBeA() {
        let string = self.guitar!.getString(byType: GuitarStringType.one)
        let fret = string.getFret(atFretNum: 5)
        
        let note = fret.note
        
        assert(note == Note.a)
    }
    
    func test12thFretOfEStringShouldBeE() {
        let string = self.guitar!.getString(byType: GuitarStringType.one)
        let fret = string.getFret(atFretNum: 12)
        
        let note = fret.note
        
        assert(note == Note.e)
    }
    
    func test14thFretOfEStringShouldBeFSharp() {
        let string = self.guitar!.getString(byType: GuitarStringType.one)
        let fret = string.getFret(atFretNum: 14)
        
        let note = fret.note
        
        assert(note == Note.fSharp)
    }
    
    func test2ndFretOfAStringShouldBeB() {
        let string = self.guitar!.getString(byType: GuitarStringType.two)
        let fret = string.getFret(atFretNum: 2)
        
        let note = fret.note
        
        assert(note == Note.b)
    }
    
    func test3rdFretOfAStringShouldBeC() {
        let string = self.guitar!.getString(byType: GuitarStringType.two)
        let fret = string.getFret(atFretNum: 3)
        
        let note = fret.note
        
        assert(note == Note.c)
    }
    
    func test1stFretOfBStringShouldBeC() {
        let string = self.guitar!.getString(byType: GuitarStringType.five)
        let fret = string.getFret(atFretNum: 1)
        
        let note = fret.note
        
        assert(note == Note.c)
    }
    
    func testShouldReturnString() {
        let guitar = self.guitar!
        let fret = guitar.getString(byType: GuitarStringType.one).getFret(atFretNum: 1)
        
        let fretString = fret.string
        
        assert(GuitarStringType.one == fretString.type)
    }
}
