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
class ChordFingerPattern: NSManagedObject {
    
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
    
    static func insertFromFingerPattern(chordType: ChordType, fingerPattern: FingerPattern, guitarTuning: GuitarTuning) -> ChordFingerPattern {
        let context = AppDelegate.persistentContainer.viewContext
        
        let chordFingerPattern = NSEntityDescription.insertNewObject(forEntityName: "ChordFingerPattern", into: context) as! ChordFingerPattern
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
    
    static func getByChordTypeAndTuning(chordType: ChordType, guitarTuning: GuitarTuning) -> [ChordFingerPattern] {
        let context = AppDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<ChordFingerPattern> = ChordFingerPattern.fetchRequest()
        request.predicate = NSPredicate(format: "(chord_name = %@) and (guitar_tuning = %@)", chordType.label, guitarTuning.label)
        
        let chordFingerPatterns = try? context.fetch(request)
        return chordFingerPatterns!
    }
    
    static func delete(_ chordFingerPatterns: [ChordFingerPattern]) {
        let context = AppDelegate.persistentContainer.viewContext
        
        for chordFingerPattern in chordFingerPatterns {
            context.delete(chordFingerPattern)
        }
    }
    
    static func deleteAll() {
        let context = AppDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<ChordFingerPattern> = ChordFingerPattern.fetchRequest()
        
        let chordFingerPatterns = try? context.fetch(request)
        delete(chordFingerPatterns!)
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
    
    static func toFingerPatterns(onGuitar guitar: Guitar, chordFingerPatterns: [ChordFingerPattern]) -> [FingerPattern] {
        return chordFingerPatterns.map { return $0.toFingerPattern(onGuitar: guitar) }
    }
}
