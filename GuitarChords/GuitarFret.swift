//
//  GuitarFret.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


class GuitarFret {
    private weak var guitarString: GuitarString?
    let fretNum: Int
    var note: Note {
        get {
            return self.string.baseNote.advanced(bySemiTones: self.fretNum)
        }
    }
    
    var string: GuitarString {
        return self.guitarString!
    }
    
    init(onString string: GuitarString, fretNum: Int) {
        print("self.guitarString: \(self.guitarString)")
        self.guitarString = string
        self.fretNum = fretNum
    }
}
