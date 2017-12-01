//
//  GuitarFret.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


class GuitarFret {
    weak var string: GuitarString?
    let fretNum: Int
    var note: Note {
        get {
            return self.string!.baseNote.advance(bySemiTones: self.fretNum)
        }
    }
    
    init(onString string: GuitarString, fretNum: Int) {
        self.string = string
        self.fretNum = fretNum
    }
}
