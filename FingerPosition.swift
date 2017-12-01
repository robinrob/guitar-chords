//
//  FingerPosition.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

class FingerPosition {
    let fret: GuitarFret?
    var isMuted: Bool {
        return fret == nil
    }
    
    init(fret: GuitarFret?) {
        self.fret = fret
    }
}
