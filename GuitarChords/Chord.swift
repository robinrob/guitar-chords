//
//  Chord.swift
//  GuitarChords
//
//  Created by  Robin Smith on 16/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


class Chord: Equatable {
    let notes: [Note]
    
    init(withNotes notes: [Note]) {
        self.notes = notes
    }

    init(ofType chordType: ChordType) {
        self.notes = ChordDictionary.chords[chordType]!.notes
    }
    
    static func == (lhs: Chord, rhs: Chord) -> Bool {
        return lhs.notes == rhs.notes
    }
}
