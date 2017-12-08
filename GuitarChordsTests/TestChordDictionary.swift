//
//  TestChordDictionary.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 08/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class TestChordDictionary: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldReturnAllChordNames() {
        let names = ChordDictionary.getAllChordNames()
        
        assert(14 == names.count)
    }
}
