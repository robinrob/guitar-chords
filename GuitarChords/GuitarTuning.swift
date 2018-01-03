//
//  GuitarTuning.swift
//  GuitarChords
//
//  Created by Robin Smith on 25/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

enum GuitarTuning: String {
    case standard = "Standard"
    case dropD = "DADGBD"
    case dropC = "CGCFAD"
    case dropB = "BF#BEG#C#"
    
    static var all: [GuitarTuning] {
        get {
            return [
                .standard,
                .dropD,
                .dropC,
                .dropB
            ]
        }
    }
    
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
    
    var label: String {
        return self.rawValue
    }
}
