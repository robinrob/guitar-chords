//
//  ChordType.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

enum ChordType: String {
    case cMajor = "C Major"
    case cSharpMajor = "C# Major"
    case cMinor = "C Minor"
    case cSharpMinor = "C# Minor"
    case dMajor = "D Major"
    case dSharpMajor = "D# Major"
    case dMinor = "D Minor"
    case dSharpMinor = "D# Minor"
    case eMajor = "E Major"
    case eSharpMajor = "E# Major"
    case eMinor = "E Minor"
    case eSharpMinor = "E# Minor"
    case fMajor = "F Major"
    case fSharpMajor = "F# Major"
    case fMinor = "F Minor"
    case fSharpMinor = "F# Minor"
    case gMajor = "G Major"
    case gSharpMajor = "G# Major"
    case gMinor = "G Minor"
    case gSharpMinor = "G# Minor"
    case aMajor = "A Major"
    case aSharpMajor = "A# Major"
    case aMinor = "A Minor"
    case aSharpMinor = "A# Minor"
    case bMajor = "B Major"
    case bSharpMajor = "B# Major"
    case bMinor = "B Minor"
    case bSharpMinor = "B# Minor"
    
    var label: String {
        return self.rawValue
    }
}
