//
//  SettingsDefaults.swift
//  GuitarChords
//
//  Created by  Robin Smith on 11/01/2018.
//  Copyright © 2018 Robin Smith. All rights reserved.
//

import Foundation


struct UserDefaultsDAO {
    static let IS_INITIALISED = "isInitialised"
    static let IS_DATABASE_INITIALISED = "isDatabaseInitialised"
    static let SHOW_MAJOR_CHORDS = "showMajorChords"
    static let SHOW_MINOR_CHORDS = "showMinorChords"
    static let SHOW_SHARP_CHORDS = "showSharpChords"
    static let GUITAR_TUNING = "guitarTuning"
    
    static let defaults: [String: Any] = [
        SHOW_MAJOR_CHORDS: true,
        SHOW_MINOR_CHORDS: true,
        SHOW_SHARP_CHORDS: true,
        GUITAR_TUNING: GuitarTuning.standard.rawValue
    ]

    static let userDefaults = UserDefaults.standard
    
    static func initialiseIfUnset() {
        if !userDefaults.bool(forKey: IS_INITIALISED) {
            initialise()
        }
    }
    
    static func initialise() {
        print("RESTTING DEFAULTS")
        resetToDefaults()
        userDefaults.set(true, forKey: IS_INITIALISED)
    }
    
    static func resetToDefaults() {
        for (key, value) in defaults {
            userDefaults.set(value, forKey: key)
        }
    }
    
    static func bool(forKey key: String) -> Bool {
        return userDefaults.bool(forKey: key)
    }
    
    static func string(forKey key: String) -> String {
        return userDefaults.string(forKey: key)!
    }
    
    static func getShowMajorChords() -> Bool {
        return userDefaults.bool(forKey: SHOW_MAJOR_CHORDS)
    }
    
    static func getShowMinorChords() -> Bool {
        return userDefaults.bool(forKey: SHOW_MINOR_CHORDS)
    }
    
    static func getShowSharpChords() -> Bool {
        return userDefaults.bool(forKey: SHOW_SHARP_CHORDS)
    }
    
    static func getShowChordTypes() -> [ChordCategory: Bool] {
        return [
            .major: getShowMajorChords(),
            .minor: getShowMinorChords(),
            .sharp: getShowSharpChords()
        ]
    }
    
    static func getGuitarTuning() -> GuitarTuning {
        return GuitarTuning(rawValue: userDefaults.string(forKey: GUITAR_TUNING)!)!
    }
    
    static func getGuitarTuningOrDefault() -> GuitarTuning {
        let tuning = userDefaults.string(forKey: GUITAR_TUNING)
        if tuning == nil {
            return GuitarTuning.standard
        } else {
            return GuitarTuning(rawValue: tuning!)!
        }
    }
    
    static func getIsDatabaseInitialised() -> Bool {
        return userDefaults.bool(forKey: IS_DATABASE_INITIALISED)
    }
    
    static func toggle(forKey key: String) {
        userDefaults.set(!userDefaults.bool(forKey: key), forKey: key)
    }
    
    static func toggleShowMajorChords() {
        userDefaults.set(!userDefaults.bool(forKey: SHOW_MAJOR_CHORDS), forKey: SHOW_MAJOR_CHORDS)
    }
    
    static func toggleShowMinorChords() {
        userDefaults.set(!userDefaults.bool(forKey: SHOW_MINOR_CHORDS), forKey: SHOW_MINOR_CHORDS)
    }
    
    static func toggleShowSharpChords() {
        userDefaults.set(!userDefaults.bool(forKey: SHOW_SHARP_CHORDS), forKey: SHOW_SHARP_CHORDS)
    }
    
    static func setGuitarTuning(tuning: GuitarTuning) {
        userDefaults.set(tuning.rawValue, forKey: GUITAR_TUNING)
    }
    
    static func setIsDatabaseInitialised(_ bool: Bool) {
        userDefaults.set(bool, forKey: IS_DATABASE_INITIALISED)
    }
}
