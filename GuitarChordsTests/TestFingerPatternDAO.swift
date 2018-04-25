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

class TestFingerPatternDAO: XCTestCase {
    private var dao = FingerPatternDAO()
    private var guitar = Guitar()
    
    override func tearDown() {
        super.tearDown()
    }
}

