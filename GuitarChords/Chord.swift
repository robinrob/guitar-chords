//
//  Chord.swift
//  GuitarChords
//
//  Created by  Robin Smith on 16/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


struct Chord: Equatable {
    let notes: [Note]
    var baseNote: Note {
        return self.notes[0]
    }
    
    init(withNotes notes: [Note]) {
        self.notes = notes
    }

    init(ofType chordType: ChordType) {
        self.notes = ChordDictionary.chords[chordType]!.notes
    }
    
    static func == (lhs: Chord, rhs: Chord) -> Bool {
        let arr1 = Set(lhs.notes)
        let arr2 = Set(rhs.notes)
        
        return arr1 == arr2
    }
}
