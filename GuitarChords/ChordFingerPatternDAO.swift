//
//  ChordFingerPatternDAO.swift
//  GuitarChords
//
//  Created by Robin Smith on 07/02/2018.
//  Copyright © 2018 Robin Smith. All rights reserved.
//

import Foundation
import CoreData

class ChordFingerPatternDAO {
    init() {
        // load data from JSON
    }
    
    func fromFingerPattern(
        fingerPattern: FingerPattern,
        chordType: ChordType,
        guitarTuning: GuitarTuning
        ) -> ChordFingerPattern {
        let chordFingerPattern = ChordFingerPattern()
        chordFingerPattern.chord_name = chordType.label
        chordFingerPattern.guitar_tuning = guitarTuning.label
        chordFingerPattern.string_1_fret = Int16(fingerPattern.getFingerPosition(byStringType: .one).fretNumAsInt)
        chordFingerPattern.string_2_fret = Int16(fingerPattern.getFingerPosition(byStringType: .two).fretNumAsInt)
        chordFingerPattern.string_3_fret = Int16(fingerPattern.getFingerPosition(byStringType: .three).fretNumAsInt)
        chordFingerPattern.string_4_fret = Int16(fingerPattern.getFingerPosition(byStringType: .four).fretNumAsInt)
        chordFingerPattern.string_5_fret = Int16(fingerPattern.getFingerPosition(byStringType: .five).fretNumAsInt)
        chordFingerPattern.string_6_fret = Int16(fingerPattern.getFingerPosition(byStringType: .six).fretNumAsInt)
        
        return chordFingerPattern
    }
    
    func stringTypeToFretColumn(_ chordFingerPattern: ChordFingerPattern, stringType: GuitarStringType) -> Any {
        switch stringType {
        case .one:
            return chordFingerPattern.string_1_fret
        case .two:
            return chordFingerPattern.string_2_fret
        case .three:
            return chordFingerPattern.string_3_fret
        case .four:
            return chordFingerPattern.string_4_fret
        case .five:
            return chordFingerPattern.string_5_fret
        case .six:
            return chordFingerPattern.string_6_fret
        }
    }
    
//     func getByChordTypeAndTuning(chordType: ChordType, guitarTuning: GuitarTuning) -> [ChordFingerPattern] {
//        return chordFingerPatterns!
//    }

    func toFingerPatterns(
        chordFingerPatterns: [ChordFingerPattern],
        onGuitar guitar: Guitar
        ) -> [FingerPattern] {
        return chordFingerPatterns.map { return self.toFingerPattern($0, onGuitar: guitar) }
    }
    
    func toFingerPattern(_ chordFingerPattern: ChordFingerPattern, onGuitar guitar: Guitar) -> FingerPattern {
        var fingerPositions: [FingerPosition] = []
        
        for stringType in GuitarStringType.all {
            let stringFret = self.stringTypesToFrets[stringType]!
            
            if stringFret > -1 {
                fingerPositions.append(FingerPosition(atFret: guitar.getString(byType: stringType).getFret(atFretNum: Int(stringFret))))
            } else {
                fingerPositions.append(FingerPosition(mutingString: guitar.getString(byType: stringType)))
            }
        }
        
        return FingerPattern(fingerPositions: fingerPositions)
    }r
    
    func fromJSON(_ json: String) -> ChordFingerPattern? {
        var chordFingerPattern: ChordFingerPattern? = nil
        do {
            chordFingerPattern = try JSONDecoder().decode(ChordFingerPattern.self, from: json.data(using: .utf8)!)
        } catch {
            print("ERROR")
        }
        return chordFingerPattern
    }
    
    //    func encode(to encoder: Encoder) throws {
    //        var container = encoder.container(keyedBy: CodingKeys.self)
    //        try container.encode(self.chord_name, forKey: .chord_name)
    //        try container.encode(self.guitar_tuning, forKey: .guitar_tuning)
    //        try container.encode(self.string_1_fret, forKey: .string_1_fret)
    //        try container.encode(self.string_2_fret, forKey: .string_2_fret)
    //        try container.encode(self.string_3_fret, forKey: .string_3_fret)
    //        try container.encode(self.string_4_fret, forKey: .string_4_fret)
    //        try container.encode(self.string_5_fret, forKey: .string_5_fret)
    //        try container.encode(self.string_6_fret, forKey: .string_6_fret)
    //    }
    
    func toJSON(_ chordFingerPattern: ChordFingerPattern) -> String? {
        let encoder = JSONEncoder()
        //        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(chordFingerPattern)
            return String(data: data, encoding: .utf8)!
        } catch {
            print("encoding error: \(error)")
        }
        return nil
    }
    
    private enum CodingKeys: String, CodingKey {
        case chord_name
        case guitar_tuning
        case string_1_fret
        case string_2_fret
        case string_3_fret
        case string_4_fret
        case string_5_fret
        case string_6_fret
    }
}
