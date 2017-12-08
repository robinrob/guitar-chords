//
//  Extensions.swift
//  GuitarChords
//
//  Created by  Robin Smith on 08/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func update(other:Dictionary) -> Dictionary {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
        return self
    }
}
