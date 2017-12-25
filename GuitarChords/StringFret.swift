//
//  StringFret.swift
//  GuitarChords
//
//  Created by  Robin Smith on 09/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


struct StringFret: Equatable {
    private let stringType: GuitarStringType
    private let fretNum: Int
    
    static func ==(lhs: StringFret, rhs: StringFret) -> Bool {
        return lhs.stringType == rhs.stringType && lhs.fretNum == rhs.fretNum
    }
    
    init(_ stringType: GuitarStringType, _ fretNum: Int) {
        self.stringType = stringType
        self.fretNum = fretNum
    }
}
