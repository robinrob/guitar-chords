//
//  TestGuitar.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 07/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import XCTest
@testable import GuitarChords

class TestGuitar: XCTestCase {
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
    
    func testShouldGetE1String() {
        let string = self.guitar!.getString(byType: GuitarStringType.one)
        
        assert(GuitarStringType.one == string.type)
    }
    
    func testShouldGetAString() {
        let string = self.guitar!.getString(byType: GuitarStringType.two)
        
        assert(GuitarStringType.two == string.type)
    }
}
