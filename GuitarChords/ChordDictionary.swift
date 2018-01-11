//
//  ChordDictionary.swift
//  GuitarChords
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

struct ChordDictionary {
    private static var majorChords: [ChordType: Chord] = [
        .cMajor: Chord(withNotes: [Note.c, Note.e, Note.g]),
        .dMajor: Chord(withNotes: [Note.d, Note.fSharp, Note.a]),
        .eMajor: Chord(withNotes: [Note.e, Note.gSharp, Note.b]),
        .fMajor: Chord(withNotes: [Note.f, Note.a, Note.c]),
        .gMajor: Chord(withNotes: [Note.g, Note.b, Note.d]),
        .aMajor: Chord(withNotes: [Note.a, Note.cSharp, Note.e]),
        .bMajor: Chord(withNotes: [Note.b, Note.dSharp, Note.fSharp])
    ]
    
    private static var majorSharpChords: [ChordType: Chord] = [
        .cSharpMajor: majorChords[.cMajor]!.raise(bySemitones: 1),
        .dSharpMajor: majorChords[.dMajor]!.raise(bySemitones: 1),
        .eSharpMajor: majorChords[.eMajor]!.raise(bySemitones: 1),
        .fSharpMajor: majorChords[.fMajor]!.raise(bySemitones: 1),
        .gSharpMajor: majorChords[.gMajor]!.raise(bySemitones: 1),
        .aSharpMajor: majorChords[.aMajor]!.raise(bySemitones: 1),
        .bSharpMajor: majorChords[.bMajor]!.raise(bySemitones: 1)
    ]
    
    private static var minorChords: [ChordType: Chord] = [
        .cMinor: Chord(withNotes: [Note.c, Note.dSharp, Note.g]),
        .dMinor: Chord(withNotes: [Note.d, Note.f, Note.a]),
        .eMinor: Chord(withNotes: [Note.e, Note.g, Note.b]),
        .fMinor: Chord(withNotes: [Note.f, Note.g, Note.c]),
        .gMinor: Chord(withNotes: [Note.g, Note.aSharp, Note.d]),
        .aMinor: Chord(withNotes: [Note.a, Note.c, Note.e]),
        .bMinor: Chord(withNotes: [Note.b, Note.d, Note.fSharp])
    ]
    
    private static var minorSharpChords: [ChordType: Chord] = [
        .cSharpMinor: minorChords[.cMinor]!.raise(bySemitones: 1),
        .dSharpMinor: minorChords[.dMinor]!.raise(bySemitones: 1),
        .eSharpMinor: minorChords[.eMinor]!.raise(bySemitones: 1),
        .fSharpMinor: minorChords[.fMinor]!.raise(bySemitones: 1),
        .gSharpMinor: minorChords[.gMinor]!.raise(bySemitones: 1),
        .aSharpMinor: minorChords[.aMinor]!.raise(bySemitones: 1),
        .bSharpMinor: minorChords[.bMinor]!.raise(bySemitones: 1)
    ]
    
    private static let allChords: [ChordType: Chord] = ChordDictionary.majorChords.update(other: ChordDictionary.minorChords.update(other: ChordDictionary.majorSharpChords.update(other: ChordDictionary.minorSharpChords)))
    
    static func getMajorChords() -> [ChordType: Chord] {
        return ChordDictionary.majorChords
    }
    
    static func getMajorChordTypes() -> [ChordType] {
        return getMajorChords().keys.map {$0}
    }
    
    static func getMajorSharpChords() -> [ChordType: Chord] {
        return ChordDictionary.majorSharpChords
    }
    
    static func getMajorSharpChordTypes() -> [ChordType] {
        return getMajorSharpChords().keys.map {$0}
    }
    
    static func getMinorChords() -> [ChordType: Chord] {
        return ChordDictionary.minorChords
    }
    
    static func getMinorChordTypes() -> [ChordType] {
        return getMinorChords().keys.map {$0}
    }
    
    static func getMinorSharpChords() -> [ChordType: Chord] {
        return ChordDictionary.minorSharpChords
    }
    
    static func getMinorSharpChordTypes() -> [ChordType] {
        return getMinorSharpChords().keys.map {$0}
    }
    
    static func getSharpChords() -> [ChordType: Chord] {
        var dict: [ChordType: Chord] = [:]
        for (key, value) in majorSharpChords {
            dict[key] = value
        }
        for (key, value) in minorSharpChords {
            dict[key] = value
        }
        return dict
    }
    
    static func getSharpChordTypes() -> [ChordType] {
        return getSharpChords().keys.map {$0}
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
