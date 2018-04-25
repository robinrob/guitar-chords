//
//  TestChordFingerPattern.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 01/01/2018.
//  Copyright © 2018 Robin Smith. All rights reserved.
//

import XCTest
import CoreData
@testable import GuitarChords

class TestChordFingerPatternDAO: XCTestCase {
    private var dao = ChordFingerPatternDAO()
    private var guitar = Guitar()
    
    override func tearDown() {
        super.tearDown()
        
        ChordFingerPatternDAO().deleteAll()
    }
    
    func testShouldInsertChordFingerPattern() {
        let fingerPattern =
        
        assert(chordFingerPattern.chord_name == "C Major")
    }

}

