//
//  ChordFingerPattern.swift
//  GuitarChords
//
//  Created by  Robin Smith on 31/12/2017.
//  Copyright © 2017 Robin Smith. All rights reserved.
//

import UIKit
import CoreData

@objc(ChordFingerPattern)
class ChordFingerPattern: NSManagedObject, Encodable {
    var stringTypesToFrets: [GuitarStringType: Int16] {
        return [
            .one: self.string_1_fret,
            .two: self.string_2_fret,
            .three: self.string_3_fret,
            .four: self.string_4_fret,
            .five: self.string_5_fret,
            .six: self.string_6_fret,
        ]
    }
    
    func toFingerPattern(onGuitar guitar: Guitar) -> FingerPattern {
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
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.chord_name, forKey: .chord_name)
        try container.encode(self.guitar_tuning, forKey: .guitar_tuning)
        try container.encode(self.string_1_fret, forKey: .string_1_fret)
        try container.encode(self.string_2_fret, forKey: .string_2_fret)
        try container.encode(self.string_3_fret, forKey: .string_3_fret)
        try container.encode(self.string_4_fret, forKey: .string_4_fret)
        try container.encode(self.string_5_fret, forKey: .string_5_fret)
        try container.encode(self.string_6_fret, forKey: .string_6_fret)
    }
    
    func toJSON() -> String {
        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(self)
            return String(data: data, encoding: .utf8)!
        } catch {
            print("encoding error: \(error)")
        }
        return ""
    }
    
    enum CodingKeys: String, CodingKey {
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
