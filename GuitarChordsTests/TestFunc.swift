//
//  TestFunc.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 08/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class TestFunc: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldBeSequenceOfInts1() {
        let ints = [4]
        
        assert(Func.isSequence(ints: ints))
    }
    
    func testShouldBeSequenceOfInts2() {
        let ints = [1, 2, 3, 4, 5]
        
        assert(Func.isSequence(ints: ints))
    }
    
    func testShouldBeSequenceOfInts3() {
        let ints = [3, 4, 5]
        
        assert(Func.isSequence(ints: ints))
    }
    
    func testShouldNotBeSequenceOfInts() {
        let ints = [1, 3, 4, 5]
        
        assert(!Func.isSequence(ints: ints))
    }
}
