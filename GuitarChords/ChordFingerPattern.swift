//
//  ChordFingerPattern.swift
//  GuitarChords
//
//  Created by  Robin Smith on 31/12/2017.
//  Copyright © 2017 Robin Smith. All rights reserved.
//

class ChordFingerPattern: Encodable, Decodable {
    let chord_name: String
    let guitar_tuning: String
    let string_1_fret: Int
    let string_2_fret: Int
    let string_3_fret: Int
    let string_4_fret: Int
    let string_5_fret: Int
    let string_6_fret: Int
    
    init(
        chordName: String,
        guitarTuning: GuitarTuning,
        string_1_fret: Int,
        string_2_fret: Int,
        string_3_fret: Int,
        string_4_fret: Int,
        string_5_fret: Int,
        string_6_fret: Int
        ) {
        self.chord_name = chordName
        self.guitar_tuning = guitarTuning.rawValue
        self.string_1_fret = string_1_fret
        self.string_2_fret = string_2_fret
        self.string_3_fret = string_3_fret
        self.string_4_fret = string_4_fret
        self.string_5_fret = string_5_fret
        self.string_6_fret = string_1_fret
    }
}
