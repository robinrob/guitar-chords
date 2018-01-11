//
//  ChordDictionary.swift
//  GuitarChords
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

struct ChordDictionary {
    private static var majorChords = [
        ChordType.cMajor: Chord(withNotes: [Note.c, Note.e, Note.g]),
        ChordType.dMajor: Chord(withNotes: [Note.d, Note.fSharp, Note.a]),
        ChordType.eMajor: Chord(withNotes: [Note.e, Note.gSharp, Note.b]),
        ChordType.fMajor: Chord(withNotes: [Note.f, Note.a, Note.c]),
        ChordType.gMajor: Chord(withNotes: [Note.g, Note.b, Note.d]),
        ChordType.aMajor: Chord(withNotes: [Note.a, Note.cSharp, Note.e]),
        ChordType.bMajor: Chord(withNotes: [Note.b, Note.dSharp, Note.fSharp])
    ]
    
    private static var minorChords = [
        ChordType.cMinor: Chord(withNotes: [Note.c, Note.dSharp, Note.g]),
        ChordType.dMinor: Chord(withNotes: [Note.d, Note.f, Note.a]),
        ChordType.eMinor: Chord(withNotes: [Note.e, Note.g, Note.b]),
        ChordType.fMinor: Chord(withNotes: [Note.f, Note.g, Note.c]),
        ChordType.gMinor: Chord(withNotes: [Note.g, Note.aSharp, Note.d]),
        ChordType.aMinor: Chord(withNotes: [Note.a, Note.c, Note.e]),
        ChordType.bMinor: Chord(withNotes: [Note.b, Note.d, Note.fSharp])
    ]
    
    private static let allChords: [ChordType: Chord] = ChordDictionary.majorChords.update(other: ChordDictionary.minorChords)
    
    static func getMajorChords() -> [ChordType: Chord] {
        return ChordDictionary.majorChords
    }
    
    static func getMajorChordTypes() -> [ChordType] {
        return getMajorChords().keys.map {$0}
    }
    
    static func getMinorChords() -> [ChordType: Chord] {
        return ChordDictionary.minorChords
    }
    
    static func getMinorChordTypes() -> [ChordType] {
        return getMinorChords().keys.map {$0}
    }
    
    static func getAllChordTypes() -> [ChordType] {
        return ChordDictionary.allChords.keys.map {$0}
    }
    
    static func getAllChordNames() -> [String] {
        return ChordDictionary.allChords.keys.map {$0.rawValue}
    }
    
    static func getChord(ofType type: ChordType) -> Chord {
        return ChordDictionary.allChords[type]!
    }
    
    static func getNotesFor(chordType: ChordType) -> [Note] {
        return ChordDictionary.allChords[chordType]!.notes
    }
}
