//
//  FingerPositionTest.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class TestFingerPosition: XCTestCase {
    private var guitar: Guitar?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.guitar = Guitar()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldBeOpenStringWhenFretIs0thFret() {
        let pos = FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 0))
        
        let isOpen = pos.isOpenString
        
        assert(true == isOpen)
    }
    
    func testShouldNotBeMutedByDefault() {
        let pos = FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 0))
        
        let isMuted = pos.isMuted
        
        assert(false == isMuted)
    }
    
    func testShouldBeMutedWhenNoFretSet() {
        let pos = FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.one))
        
        let isMuted = pos.isMuted
        
        assert(true == isMuted)
    }
    
    func testShouldBeMutedAfterManuallyMuted() {
        var pos = FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.one).getFret(atFretNum: 0))
        pos.mute()
        
        let isMuted = pos.isMuted
        
        assert(true == isMuted)
    }
    
    func testPositionOnFretShouldReturnString() {
        let pos = FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.two).getFret(atFretNum: 2))
        
        let string = pos.guitarString
        
        assert(GuitarStringType.two == string.type)
    }
    
    func testMutedPositionShouldReturnString() {
        let pos = FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.four))
        
        let string = pos.guitarString
        
        assert(GuitarStringType.four == string.type)
    }
}
