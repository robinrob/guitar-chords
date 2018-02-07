//
//  UserDatabase.swift
//  GuitarChords
//
//  Created by  Robin Smith on 12/01/2018.
//  Copyright © 2018 Robin Smith. All rights reserved.
//

import Foundation


struct AppDataDAO {
    static func deleteAllPreloadedData() {
        ChordFingerPattern.deleteAll()
    }
}
