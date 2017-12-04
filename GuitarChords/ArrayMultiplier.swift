//
//  ArrayMultiplier.swift
//  GuitarChords
//
//  Created by  Robin Smith on 04/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

class ArrayMultiplier<T> {
    func multiply(_ listOfArrays: [[T]]) -> [[T]] {
        var result: [[T]] = []
        for array in listOfArrays {
            result = self.multiply(listOfArrays: result, by: array)
        }
        return result
    }
    
    private func multiply(listOfArrays: [[T]], by multiplyingArray: [T]) -> [[T]] {
        var result: [[T]] = []
        if listOfArrays.count > 0 {
            for array in listOfArrays {
                for item in multiplyingArray {
                    result.append(array + [item])
                }
            }
        } else {
            for item in multiplyingArray {
                result.append([item])
            }
        }
        return result
    }
}

