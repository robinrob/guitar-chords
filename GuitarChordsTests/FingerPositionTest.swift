//
//  FingerPositionTest.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class FingerPositionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldBeMutedWhenNoFretSet() {
        let pos = FingerPosition(atFret: nil)
        
        let isMuted = pos.isMuted
        
        assert(true == isMuted)
    }
    
    func testShouldBeOpenStringWhenFretIs0thFret() {
        let pos = FingerPosition(atFret: Mocks.mockGuitarFret(withFretNum: 0))
        
        let isOpen = pos.isOpenString
        
        assert(true == isOpen)
    }
    
}

