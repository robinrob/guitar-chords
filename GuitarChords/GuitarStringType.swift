//
//  GuitarStringType.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

enum GuitarStringType: String {
    case e1 = "E1"
    case a = "A"
    case d = "D"
    case g = "G"
    case b = "B"
    case e2 = "E2"
    
    var baseNote: Note {
        switch self {
        case GuitarStringType.e1:
            return Note.e
        case GuitarStringType.a:
            return Note.a
        case GuitarStringType.d:
            return Note.d
        case GuitarStringType.g:
            return Note.g
        case GuitarStringType.b:
            return Note.b
        case GuitarStringType.e2:
            return Note.e
        }
    }
    
    static func all() -> [GuitarStringType] {
        return [.e1, .a, .d, .g, .b, .e2]
    }
}
