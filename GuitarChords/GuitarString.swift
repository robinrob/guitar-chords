//
//  GuitarString.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

class GuitarString {
    var type: GuitarStringType
    var baseNote: Note
    var frets: [GuitarFret]
    
    init(ofType stringType: GuitarStringType, withBaseNote: Note) {
        self.baseNote = withBaseNote
        self.type = stringType
        
        self.frets = []
        for fretNum in 1...14 {
            self.frets.append(GuitarFret(onString: self, fretNum: fretNum))
        }
    }
    
    func getFret(atFretNum: Int) -> GuitarFret {
        return self.frets[atFretNum-1]
    }
}
