//
//  Note.swift
//  GuitarChords
//
//  Created by  Robin Smith on 16/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

enum Note: Int {
    case c = 1
    case cSharp = 2
    case d = 3
    case dSharp = 4
    case e = 5
    case f = 6
    case fSharp = 7
    case g = 8
    case gSharp = 9
    case a = 10
    case aSharp = 11
    case b = 12
    
    public func advance(bySemiTones: Int) -> Note {
        return Note(rawValue: (self.rawValue + bySemiTones) % 12)!
    }
}
