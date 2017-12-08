//
//  Func.swift
//  GuitarChords
//
//  Created by  Robin Smith on 08/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation


struct Func {
    static func isSequence(ints: [Int]) -> Bool {
        for (index, int) in ints.enumerated() {
            if ints.count > index+1 && ints[index+1] != int+1 {
                return false
            }
        }
        return true
    }
}
