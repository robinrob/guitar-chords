//
//  ChordFingerPatternDAO.swift
//  GuitarChords
//
//  Created by  Robin Smith on 31/12/2017.
//  Copyright © 2017 Robin Smith. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ChordFingerPatternDAO {
    
    func insertFromFingerPattern(chordName: String, fingerPattern: FingerPattern, guitarTuning: GuitarTuning) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let chordFingerPattern = NSEntityDescription.insertNewObject(forEntityName: "ChordFingerPattern", into: context) as! ChordFingerPattern
        chordFingerPattern.chord_name = chordName
        chordFingerPattern.guitar_tuning = guitarTuning.rawValue
        chordFingerPattern.string_1_fret = Int16(fingerPattern.getFingerPosition(byStringType: .one).fretNumAsInt)
        chordFingerPattern.string_2_fret = Int16(fingerPattern.getFingerPosition(byStringType: .two).fretNumAsInt)
        chordFingerPattern.string_3_fret = Int16(fingerPattern.getFingerPosition(byStringType: .three).fretNumAsInt)
        chordFingerPattern.string_4_fret = Int16(fingerPattern.getFingerPosition(byStringType: .four).fretNumAsInt)
        chordFingerPattern.string_5_fret = Int16(fingerPattern.getFingerPosition(byStringType: .five).fretNumAsInt)
        chordFingerPattern.string_6_fret = Int16(fingerPattern.getFingerPosition(byStringType: .six).fretNumAsInt)
        
        do {
            try context.save()
        } catch {
            fatalError("Failed to save context: \(error)")
        }
    }
}
