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
    
    func testShouldGetE1String() {
        let string = self.guitar!.getString(byType: GuitarStringType.one)
        
        assert(GuitarStringType.one == string.type)
    }
    
    func testShouldGetAString() {
        let string = self.guitar!.getString(byType: GuitarStringType.two)
        
        assert(GuitarStringType.two == string.type)
    }
}
