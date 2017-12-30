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
                .one: .e,
                .two: .a,
                .three: .d,
                .four: .g,
                .five: .b,
                .six: .e
            ]
        case .dropD:
            return [
                .one: .d,
                .two: .a,
                .three: .d,
                .four: .g,
                .five: .b,
                .six: .d
            ]
        case .dropC:
            return [
                .one: .c,
                .two: .g,
                .three: .c,
                .four: .f,
                .five: .a,
                .six: .d
            ]
        case .dropB:
            return [
                .one: .b,
                .two: .fSharp,
                .three: .b,
                .four: .e,
                .five: .gSharp,
                .six: .cSharp
            ]
        }
    }
}
