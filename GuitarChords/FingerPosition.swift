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
        return self.fret == nil
    }
    var isOpenString: Bool {
        return self.fret!.fretNum == 0
    }
    var note: Note {
        return self.fret!.note
    }
    
    init(atFret fret: GuitarFret?) {
        self.fret = fret
    }
}
