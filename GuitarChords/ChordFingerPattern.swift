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
    
    static func insertFromFingerPattern(chordType: ChordType, fingerPattern: FingerPattern, guitarTuning: GuitarTuning) -> ChordFingerPattern {
        let context = AppDelegate.persistentContainer.viewContext
        
        let chordFingerPattern = NSEntityDescription.insertNewObject(forEntityName: "ChordFingerPattern", into: context) as! ChordFingerPattern
        chordFingerPattern.chord_name = chordType.name
        chordFingerPattern.guitar_tuning = guitarTuning.rawValue
        chordFingerPattern.string_1_fret = Int16(fingerPattern.getFingerPosition(byStringType: .one).fretNumAsInt)
        chordFingerPattern.string_2_fret = Int16(fingerPattern.getFingerPosition(byStringType: .two).fretNumAsInt)
        chordFingerPattern.string_3_fret = Int16(fingerPattern.getFingerPosition(byStringType: .three).fretNumAsInt)
        chordFingerPattern.string_4_fret = Int16(fingerPattern.getFingerPosition(byStringType: .four).fretNumAsInt)
        chordFingerPattern.string_5_fret = Int16(fingerPattern.getFingerPosition(byStringType: .five).fretNumAsInt)
        chordFingerPattern.string_6_fret = Int16(fingerPattern.getFingerPosition(byStringType: .six).fretNumAsInt)
        
        return chordFingerPattern
    }
}
