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
        let pos = FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.e1).getFret(atFretNum: 0))
        
        let isOpen = pos.isOpenString
        
        assert(true == isOpen)
    }
    
    func testShouldBeMutedWhenNoFretSet() {
        let pos = FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.e1))
        
        let isMuted = pos.isMuted
        
        assert(true == isMuted)
    }
    
    func testPositionOnFretShouldReturnString() {
        let pos = FingerPosition(atFret: self.guitar!.getString(byType: GuitarStringType.a).getFret(atFretNum: 2))
        
        let string = pos.guitarString
        
        assert(GuitarStringType.a == string.type)
    }
    
    func testMutedPositionShouldReturnString() {
        let pos = FingerPosition(mutingString: self.guitar!.getString(byType: GuitarStringType.g))
        
        let string = pos.guitarString
        
        assert(GuitarStringType.g == string.type)
    }
}
