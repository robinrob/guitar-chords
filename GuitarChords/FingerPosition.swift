//
//  FingerPosition.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

struct FingerPosition: Equatable, Hashable {
    var hashValue: Int {
        get {
//            let val = self.guitarString.type.hashValue
//            if self.fret != nil {
//                val *= self.fret.hash
//            }
//            return val
            return 1
        }
    }
    
    let fret: GuitarFret?
    private let string: GuitarString?
    private var muted = false
    var isMuted: Bool {
        return (self.fret == nil) || self.muted
    }
    var isOpenString: Bool {
        return !self.isMuted && self.fret!.fretNum == 0
    }
    var note: Note? {
        if self.isMuted {
            return nil
        } else {
            return self.fret!.note
        }
    }
    var guitarString: GuitarString {
        if self.fret == nil {
            return self.string!
        } else {
            return self.fret!.string
        }
    }
    var fretNum: Int? {
        if self.fret == nil {
            return nil
        } else {
            return self.fret!.fretNum
        }
    }
    
    var fretNumAsInt: Int {
        if self.fretNum == nil {
            return -1
        } else {
            return self.fretNum!
        }
    }
    
    init(atFret fret: GuitarFret) {
        self.fret = fret
        self.string = nil
    }
    
    init(mutingString string: GuitarString) {
        self.string = string
        self.fret = nil
    }
    
    init(onGuitar guitar: Guitar, forStringType stringType: GuitarStringType, atFretNum fretNum: Int) {
        if (fretNum == -1) {
            self.string = guitar.getString(byType: stringType)
            self.fret = nil
        } else {
            self.fret = GuitarFret(onString: guitar.getString(byType: stringType), fretNum: fretNum)
            self.string = nil
        }
    }
    
    mutating func mute() {
        self.muted = true
    }
    
    mutating func unmuteIfFretPosition() {
        if self.fret != nil {
            self.muted = false
        }
    }
    
    static func ==(lhs: FingerPosition, rhs: FingerPosition) -> Bool {
        return (lhs.guitarString.type == rhs.guitarString.type) && (lhs.fretNum == rhs.fretNum)
    }
}
