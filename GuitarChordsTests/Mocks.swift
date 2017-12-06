//
//  Mocks.swift
//  GuitarChordsTests
//
//  Created by  Robin Smith on 06/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation
@testable import GuitarChords

struct Mocks {
    static func mockGuitar() -> Guitar {
        return MockGuitar()
    }
    
    static func createE1String() -> GuitarString {
        return MockGuitarString(onGuitar: mockGuitar(), ofType: GuitarStringType.e1)
    }
    
    static func mockGuitarString() -> GuitarString {
        return MockGuitarString(onGuitar: mockGuitar(), ofType: GuitarStringType.e1)
    }
    
    static func mockGuitarFret(withFretNum fretNum: Int = 0) -> GuitarFret {
        return MockGuitarFret(onString: mockGuitarString(), fretNum: fretNum)
    }
    
    class MockGuitar: Guitar {}
    class MockGuitarString: GuitarString {}
    class MockGuitarFret: GuitarFret {}
}

