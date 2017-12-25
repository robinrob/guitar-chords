//
//  GuitarString.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

class GuitarString: Equatable {
    weak var guitar: Guitar?
    var type: GuitarStringType
    let baseNote: Note
    private var frets: [GuitarFret]
    var numFrets: Int {
        return self.guitar!.numFrets
    }
    
    required init(onGuitar guitar: Guitar, ofType stringType: GuitarStringType, withBaseNote baseNote: Note) {
        self.guitar = guitar
        self.type = stringType
        self.baseNote = baseNote
        
        self.frets = []
        for fretNum in 0...self.guitar!.numFrets {
            self.frets.append(GuitarFret(onString: self, fretNum: fretNum))
        }
    }
    
    func getFret(atFretNum fretNum: Int) -> GuitarFret {
        return self.frets[fretNum]
    }
    
    static func == (lhs: GuitarString, rhs: GuitarString) -> Bool {
        return lhs.type == rhs.type
    }
}

