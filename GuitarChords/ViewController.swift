//
//  ViewController.swift
//  GuitarChords
//
//  Created by  Robin Smith on 10/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    typealias FretView = FretButton
    typealias StringView = [FretView]
    
    @IBOutlet weak var chordPicker: UIPickerView!
    @IBOutlet weak var chordVariationPicker: UIPickerView!
    
    @IBOutlet var e1: StringView!
    @IBOutlet var a: StringView!
    @IBOutlet var d: StringView!
    @IBOutlet var g: StringView!
    @IBOutlet var b: StringView!
    @IBOutlet var e2: StringView!

    
    let guitar = Guitar()
    
    var chordChoices = ChordDictionary.getAllChordNames().sorted()
    
    var chordVariationChoices: [Int] = []
    
    var stringTypesToStringViews: [GuitarStringType: StringView] {
        get {
            return [
                GuitarStringType.e1: e1,
                GuitarStringType.a: a,
                GuitarStringType.d: d,
                GuitarStringType.g: g,
                GuitarStringType.b: b,
                GuitarStringType.e2: e2
            ]
        }
    }
    
    var chordVariationFingerPatterns: [Int: FingerPattern] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        chordPicker.dataSource = self
        chordPicker.delegate = self
        chordVariationPicker.dataSource = self
        chordVariationPicker.delegate = self
        
        for stringName in stringTypesToStringViews.keys {
            let string = stringTypesToStringViews[stringName]!
            
            for (fretIndex, fret) in string.enumerated() {
                fret.addTarget(self, action: #selector(pressFret(_:)), for: .touchUpInside)
                fret.name = "\(stringName)\(fretIndex+1)"
            }
        }
        
        updateVariationsFor(chordName: chordChoices[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case chordPicker:
            return self.chordChoices.count
        case chordVariationPicker:
            return self.chordVariationChoices.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        switch pickerView {
        case chordPicker:
            return self.chordChoices[row]
        case chordVariationPicker:
            if chordVariationChoices[row] > -1 {
                return "Variation \(self.chordVariationChoices[row])"
            } else {
                return "No Options"
            }
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                             didSelectRow row: Int,
                             inComponent component: Int) {
        switch pickerView {
        case chordPicker:
            updateVariationsFor(chordName: self.chordChoices[row])
        case chordVariationPicker:
            let varationCode = chordVariationChoices[row]
            if varationCode > -1 {
                displayFingerPattern(self.chordVariationFingerPatterns[varationCode]!)
            }
        default:
            print("Unrecognised picker view choice")
        }
    }
    
    func updateVariationsFor(chordName: String) {
        let fingerPatterns = self.guitar.findAllFingerPatterns(ofChordType: ChordType(rawValue: chordName)!, withMaxFretWidth: 3).sorted {
            a, b in
            a.notes.count > b.notes.count || a.averageFretNum < b.averageFretNum
        }
        
        if fingerPatterns.count > 0 {
            self.chordVariationFingerPatterns = [:]
            for (variationNum, fingerPattern) in fingerPatterns.enumerated() {
                self.chordVariationFingerPatterns[variationNum+1] = fingerPattern
                self.chordVariationChoices = self.chordVariationFingerPatterns.keys.map({$0}).sorted()
            }
            
            displayFingerPattern(fingerPatterns[0])
        } else {
            self.chordVariationChoices = [-1]
        }

        chordVariationPicker.selectRow(0, inComponent: 0, animated: false)
        chordVariationPicker.reloadAllComponents()
    }

    func displayFingerPattern(_ fingerPattern: FingerPattern) {
        clearAllStrings()
        
        print("fingerPattern: \(fingerPattern)")
        for fingerPosition in fingerPattern.fingerPositions {
            let stringView = stringTypesToStringViews[fingerPosition.guitarString.type]!
            
            if fingerPosition.isMuted {
                muteStringView(stringView)
            } else if !fingerPosition.isOpenString && fingerPosition.fretNum! > 0 {
                selectFretView(stringView, fingerPosition.fretNum!)
            }
        }
    }
    
    func muteStringView(_ stringView: StringView) {
        for fret in stringView {
            fret.backgroundColor = UIColor.gray
        }
    }

    func selectFretView(_ string: StringView, _ fretNum: Int) {
        string[fretNum-1].backgroundColor = UIColor.red
    }

    func clearAllStrings() {
        for string in stringTypesToStringViews.values {
            clearString(string)
        }
    }

    func clearString(_ string: StringView) {
        for fret in string {
            fret.reset()
        }
    }

    func initStrings() {
        clearAllStrings()
    }
    
    
    @objc func pressFret(_ sender: FretView) {
        sender.activate()
        print("sender.name: \(String(describing: sender.name!))")
    }
}


