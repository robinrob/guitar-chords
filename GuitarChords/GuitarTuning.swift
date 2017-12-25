//
//  GuitarTuning.swift
//  GuitarChords
//
//  Created by Robin Smith on 25/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

enum GuitarTuning {
    case standard
    case dropD
    case dropC
    case dropB
    
    var notes: [GuitarStringType: Note] {
        switch self {
        case .standard:
            return [
                GuitarStringType.one: Note.e,
                GuitarStringType.two: Note.a,
                GuitarStringType.three: Note.d,
                GuitarStringType.four: Note.g,
                GuitarStringType.five: Note.b,
                GuitarStringType.six: Note.e
            ]
        case .dropD:
            return [
                GuitarStringType.one: Note.d,
                GuitarStringType.two: Note.a,
                GuitarStringType.three: Note.d,
                GuitarStringType.four: Note.g,
                GuitarStringType.five: Note.b,
                GuitarStringType.six: Note.d
            ]
        case .dropC:
            return [
                GuitarStringType.one: Note.c,
                GuitarStringType.two: Note.g,
                GuitarStringType.three: Note.c,
                GuitarStringType.four: Note.f,
                GuitarStringType.five: Note.a,
                GuitarStringType.six: Note.d
            ]
        case .dropB:
            return [
                GuitarStringType.one: Note.b,
                GuitarStringType.two: Note.fSharp,
                GuitarStringType.three: Note.b,
                GuitarStringType.four: Note.e,
                GuitarStringType.five: Note.gSharp,
                GuitarStringType.six: Note.cSharp
            ]
        }
    }
}
