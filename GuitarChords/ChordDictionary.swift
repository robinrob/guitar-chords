//
//  ChordDictionary.swift
//  GuitarChords
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

struct ChordDictionary {
    static let majorChords = [
        ChordType.cMajor: Chord(withNotes: [Note.c, Note.e, Note.g]),
        ChordType.dMajor: Chord(withNotes: [Note.d, Note.fSharp, Note.a]),
        ChordType.eMajor: Chord(withNotes: [Note.e, Note.gSharp, Note.b]),
        ChordType.fMajor: Chord(withNotes: [Note.f, Note.a, Note.c]),
        ChordType.gMajor: Chord(withNotes: [Note.g, Note.b, Note.d]),
        ChordType.aMajor: Chord(withNotes: [Note.a, Note.cSharp, Note.e]),
        ChordType.bMajor: Chord(withNotes: [Note.b, Note.dSharp, Note.fSharp])
    ]
    
    static let chords = ChordDictionary.majorChords
    
    static func getMajorChords() -> [ChordType: Chord] {
        return ChordDictionary.majorChords
    }
    
    static func getNotesFor(chordType: ChordType) -> [Note] {
        return ChordDictionary.chords[chordType]!.notes
    }
}
