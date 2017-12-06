//
//  TestChord.swift
//  GuitarChords
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


func testChord() {
    let chord = Chord(ofType: ChordType.cMajor)
    
    let notes = chord.notes
    
    assert(notes == [Note.c, Note.e, Note.g])
}
