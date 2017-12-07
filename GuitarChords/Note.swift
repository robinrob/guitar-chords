//
//  Note.swift
//  GuitarChords
//
//  Created by  Robin Smith on 16/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

enum Note: Int {
    case c = 0
    case cSharp = 1
    case d = 2
    case dSharp = 3
    case e = 4
    case f = 5
    case fSharp = 6
    case g = 7
    case gSharp = 8
    case a = 9
    case aSharp = 10
    case b = 11
    
    public func advanced(bySemiTones semiTones: Int) -> Note {
        return Note(rawValue: (self.rawValue + semiTones) % 12)!
    }
}
