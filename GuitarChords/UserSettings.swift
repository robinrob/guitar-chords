//
//  UserSettings.swift
//  GuitarChords
//
//  Created by  Robin Smith on 03/01/2018.
//  Copyright © 2018 Robin Smith. All rights reserved.
//

import Foundation
import CoreData

@objc(UserSettings)
class UserSettings: NSManagedObject {
    
    func setGuitarTuning(_: GuitarTuning) {
        let context = AppDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<ChordFingerPattern> = UserDefaults.fetchRequest()
        request.predicate = NSPredicate(format: "(chord_name = %@) and (guitar_tuning = %@)", chordType.label, guitarTuning.label)
        
        let chordFingerPatterns = try? context.fetch(request)
    }
}
