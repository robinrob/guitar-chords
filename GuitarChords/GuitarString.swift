//
//  GuitarString.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

class GuitarString {
    var baseNote: Note
    var frets: [GuitarFret]
    
    init(withBaseNote: Note) {
        self.baseNote = withBaseNote
        
        self.frets = []
        for fretNum in 1...14 {
            self.frets.append(GuitarFret(onString: self, fretNum: fretNum))
        }
    }
    
    func getFret(atFretNum: Int) -> GuitarFret {
        return self.frets[atFretNum-1]
    }
}
