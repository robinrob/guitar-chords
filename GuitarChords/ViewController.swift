//
//  ViewController.swift
//  GuitarChords
//
//  Created by  Robin Smith on 10/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var chordChoice: UIPickerView!
    @IBOutlet weak var variationChoice: UIPickerView!
    
    @IBOutlet var e1: [FretButton]!
    @IBOutlet var a: [FretButton]!
    @IBOutlet var d: [FretButton]!
    @IBOutlet var g: [FretButton]!
    @IBOutlet var b: [FretButton]!
    @IBOutlet var e2: [FretButton]!

    let guitar = Guitar()
    var chords = ChordType.getAllMajorNames()
    
    var variations: [String] = []
    
    var stringTypesToStringViews: [GuitarStringType: [FretButton]] {
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
    
    var chordVariationFingerPatterns: [String: FingerPattern] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        chordChoice.dataSource = self
        chordChoice.delegate = self
        variationChoice.dataSource = self
        variationChoice.delegate = self
        
        for stringName in stringTypesToStringViews.keys {
            let string = stringTypesToStringViews[stringName]!
            
            for (fretIndex, fret) in string.enumerated() {
                fret.addTarget(self, action: #selector(pressFret(_:)), for: .touchUpInside)
                fret.name = "\(stringName)\(fretIndex+1)"
            }
        }
        
        updateVariationsFor(chordName: chords[0])
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
        case chordChoice:
            return self.chords.count
        case variationChoice:
            return self.variations.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        switch pickerView {
        case chordChoice:
            return self.chords[row]
        case variationChoice:
            return self.variations[row]
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                             didSelectRow row: Int,
                             inComponent component: Int) {
        switch pickerView {
        case chordChoice:
            updateVariationsFor(chordName: chords[row])
        case variationChoice:
            let varationName = variations[row]
            displayFingerPattern(self.chordVariationFingerPatterns[varationName]!)
        default:
            print("Unrecognised picker view choice")
        }
    }
    
    func updateVariationsFor(chordName: String) {
        let fingerPatterns = self.guitar.findAllFingerPatterns(ofChordType: ChordType(rawValue: chordName)!, withMaxFretWidth: 3)
        
        self.chordVariationFingerPatterns = [:]
        for (variationNum, fingerPattern) in fingerPatterns.enumerated() {
            self.chordVariationFingerPatterns[("Variation \(variationNum)")] = fingerPattern
            self.variations = Array<String>(self.chordVariationFingerPatterns.keys).sorted()
        }
        
        if fingerPatterns.count > 0 {
            variationChoice.reloadAllComponents()
            variationChoice.selectRow(0, inComponent: 0, animated: false)
            displayFingerPattern(fingerPatterns[0])
        } else {
            variations = ["No options"]
        }
    }

    func displayFingerPattern(_ fingerPattern: FingerPattern) {
        clearAllStrings()
        
        print("fingerPattern: \(fingerPattern)")
        for fingerPosition in fingerPattern.fingerPositions {
            let stringView = stringTypesToStringViews[fingerPosition.guitarString.type]!
            
            if fingerPosition.isMuted {
                muteStringView(stringView)
            } else if !fingerPosition.isOpenString && fingerPosition.fretNum! > 0 {
                selectFret(stringView, fingerPosition.fretNum!)
            }
        }
    }
    
    func muteStringView(_ stringView: [FretButton]) {
        for fret in stringView {
            fret.backgroundColor = UIColor.gray
        }
    }

    func selectFret(_ string: [FretButton], _ fretNum: Int) {
        string[fretNum-1].backgroundColor = UIColor.red
    }

    func clearAllStrings() {
        for string in stringTypesToStringViews.values {
            clearString(string)
        }
    }

    func clearString(_ string: [FretButton]) {
        for fret in string {
            fret.reset()
        }
    }

    func initStrings() {
        clearAllStrings()
    }
    
    
    @objc func pressFret(_ sender: FretButton) {
        sender.activate()
        print("sender.name: \(String(describing: sender.name!))")
    }
}


