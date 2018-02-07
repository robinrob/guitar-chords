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
        var container = encoder.container(keyedBy: ChordFingerPatternCodingKey.self)
        try container.encode(self.chord_name, forKey: .chord_name)
        try container.encode(self.guitar_tuning, forKey: .guitar_tuning)
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
}
