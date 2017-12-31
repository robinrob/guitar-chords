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
    
    @IBOutlet var stringOneView: StringView!
    @IBOutlet var stringTwoView: StringView!
    @IBOutlet var stringThreeView: StringView!
    @IBOutlet var stringFourView: StringView!
    @IBOutlet var stringFiveView: StringView!
    @IBOutlet var stringSixView: StringView!

    var guitar: Guitar?
    var guitarTuning: GuitarTuning = GuitarTuning.standard {
        didSet {
            self.initGuitar()
        }
    }
    
    var chordChoices = ChordDictionary.getAllChordNames().sorted()
    
    var chordVariationChoices: [Int] = []
    
    var stringTypesToStringViews: [GuitarStringType: StringView] {
        get {
            return [
                .one: stringOneView,
                .two: stringTwoView,
                .three: stringThreeView,
                .four: stringFourView,
                .five: stringFiveView,
                .six: stringSixView
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
        
        initGuitar()
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
    
    func initGuitar() {
        self.guitar = Guitar(withTuning: self.guitarTuning)
        
        for stringType in GuitarStringType.all {
            let string = stringTypesToStringViews[stringType]!
            
            for (fretIndex, fret) in string.enumerated() {
//                fret.addTarget(self, action: #selector(selectFret(_:)), for: .touchUpInside)
                fret.isEnabled = false
                fret.setTitleColor(UIColor.black, for: .highlighted)
                fret.setTitleColor(UIColor.black, for: .focused)
                fret.setTitleColor(UIColor.black, for: .normal)
                fret.setTitleColor(UIColor.black, for: .selected)
                fret.setTitleColor(UIColor.black, for: .reserved)
                fret.setTitleColor(UIColor.black, for: .disabled)
                fret.name = "\(stringType.rawValue)\(fretIndex+1)"
                let note = guitar!.getString(byType: stringType).getFret(atFretNum: fretIndex+1).note
                fret.setTitle(note.label, for: UIControlState.normal)
            }
        }
        updateVariationsFor(chordName: chordChoices[0])
    }
    
    func updateVariationsFor(chordName: String) {
        let fingerPatterns = self.guitar!.findAllFingerPatterns(ofChordType: ChordType(rawValue: chordName)!, withMaxFretWidth: 3).sorted {
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
        resetAllStrings()
        
        for fingerPosition in fingerPattern.fingerPositions {
            let stringView = stringTypesToStringViews[fingerPosition.guitarString.type]!
            
            if fingerPosition.isMuted {
                muteStringView(stringView)
            } else if !fingerPosition.isOpenString && fingerPosition.fretNum! > 0 {
                applyFingerPositionToStringFretNum(stringView, fingerPosition)
            }
        }
    }
    
    func resetAllStrings() {
        for string in stringTypesToStringViews.values {
            resetString(string)
        }
    }
    
    func resetString(_ string: StringView) {
        for fret in string {
            fret.reset()
        }
    }
    
    func muteStringView(_ stringView: StringView) {
        for fret in stringView {
            fret.backgroundColor = UIColor.gray
        }
    }
    
    func applyFingerPositionToStringFretNum(_ string: StringView, _ fingerPosition: FingerPosition) {
        let fretView = string[fingerPosition.fretNum! - 1]
        self.selectFret(fretView)
    }
    
    @objc func selectFret(_ sender: FretView) {
        sender.select()
    }
}


