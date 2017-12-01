//
//  Chord.swift
//  GuitarChords
//
//  Created by  Robin Smith on 16/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


class Chord: Equatable {
    private static let majorChords = [
        ChordType.cMajor: Chord(withNotes: [Note.c, Note.e, Note.g]),
        ChordType.dMajor: Chord(withNotes: [Note.d, Note.fSharp, Note.a]),
        ChordType.eMajor: Chord(withNotes: [Note.e, Note.gSharp, Note.b]),
        ChordType.fMajor: Chord(withNotes: [Note.f, Note.a, Note.c]),
        ChordType.gMajor: Chord(withNotes: [Note.g, Note.b, Note.d]),
        ChordType.aMajor: Chord(withNotes: [Note.a, Note.cSharp, Note.e]),
        ChordType.bMajor: Chord(withNotes: [Note.b, Note.dSharp, Note.fSharp])
    ]
    private static let chords = Chord.majorChords
    let notes: [Note]
    
    static func getMajorChords() -> [ChordType: Chord] {
        return Chord.majorChords
    }
    
    init(withNotes notes: [Note]) {
        self.notes = notes
    }

    init(ofType chordType: ChordType) {
        self.notes = Chord.chords[chordType]!.notes
    }
    
    static func == (lhs: Chord, rhs: Chord) -> Bool {
        return lhs.notes == rhs.notes
    }
}
