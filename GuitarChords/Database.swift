//
//  Database.swift
//  GuitarChords
//
//  Created by  Robin Smith on 31/12/2017.
//  Copyright © 2017 Robin Smith. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Database {
    static func save() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
            try context.save()
        } catch {
            fatalError("Failed to save context: \(error)")
        }
    }
}
