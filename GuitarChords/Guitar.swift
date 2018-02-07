//
//  Guitar.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


class Guitar {
    let numFrets: Int
    let tuning: GuitarTuning
    var strings: [GuitarString]
    
    static var defaultNumFrets = 14
    
    init(withTuning tuning: GuitarTuning = .standard, withNumFrets numFrets: Int = Guitar.defaultNumFrets) {
        self.numFrets = numFrets
        self.tuning = tuning
    
        self.strings = []
        for stringType in GuitarStringType.all {
            let note = tuning.notes[stringType]!
            
            self.strings.append(
                GuitarString(onGuitar: self, ofType: stringType, withBaseNote: note)
            )
        }
    }
    
    func getString(byType type: GuitarStringType) -> GuitarString {
        return self.strings.filter({ $0.type == type }).first!
    }
}
