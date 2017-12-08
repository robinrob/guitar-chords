//
//  TestExtensions.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 08/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class TestExtensions: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDictionaryShouldUpdateWithOtherDictionary() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var dict1 = [
            "One": 1,
            "Two": 2,
            "Three": 3
        ]
        
        let dict2 = [
            "Four": 4,
            "Five": 5,
            "Six": 6
        ]
        
        dict1 = dict1.update(other: dict2)
        
        assert(6 == dict1.keys.count)
    }
}
