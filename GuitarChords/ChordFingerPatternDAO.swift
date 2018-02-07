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
    var context: NSManagedObjectContext?
    
    init() {}
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func insertNew() -> ChordFingerPattern {
        return NSEntityDescription.insertNewObject(
            forEntityName: "ChordFingerPattern",
            into: self.context!
        ) as! ChordFingerPattern
    }
     func insertFromFingerPattern(
        fingerPattern: FingerPattern,
        chordType: ChordType,
        guitarTuning: GuitarTuning
        ) -> ChordFingerPattern {
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
    
     func getByChordTypeAndTuning(chordType: ChordType, guitarTuning: GuitarTuning) -> [ChordFingerPattern] {
        let context = AppDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<ChordFingerPattern> = ChordFingerPattern.fetchRequest()
        request.predicate = NSPredicate(format: "(chord_name = %@) and (guitar_tuning = %@)", chordType.label, guitarTuning.label)
        
        let chordFingerPatterns = try? context.fetch(request)
        return chordFingerPatterns!
    }
    
     func delete(_ chordFingerPatterns: [ChordFingerPattern]) {
        let context = AppDelegate.persistentContainer.viewContext
        
        for chordFingerPattern in chordFingerPatterns {
            context.delete(chordFingerPattern)
        }
    }
    
     func deleteAll() {
        let context = AppDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<ChordFingerPattern> = ChordFingerPattern.fetchRequest()
        
        let chordFingerPatterns = try? context.fetch(request)
        delete(chordFingerPatterns!)
    }
    
     func deleteAllSharp() {
        let context = AppDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<ChordFingerPattern> = ChordFingerPattern.fetchRequest()
        request.predicate = NSPredicate(format: "(chord_name like *# Major)")
        
        let chordFingerPatterns = try? context.fetch(request)
        delete(chordFingerPatterns!)
    }
    
    func toFingerPatterns(
        chordFingerPatterns: [ChordFingerPattern],
        onGuitar guitar: Guitar
        ) -> [FingerPattern] {
        return chordFingerPatterns.map { return $0.toFingerPattern(onGuitar: guitar) }
    }
}
