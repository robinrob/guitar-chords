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
    
    var chords = [
        "C Major",
        "D Major",
        "E Major",
        "F Major",
        "G Major",
        "A Major",
        "B Major",
        "C Major"
    ]
    
    var variations = [
        "One"
    ]
    
    var strings: [String: [FretButton]] {
        get {
            return [
                "e1": e1,
                "a": a,
                "d": d,
                "g": g,
                "b": b,
                "e2": e2
            ]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        chordChoice.dataSource = self
        chordChoice.delegate = self
        variationChoice.dataSource = self
        variationChoice.delegate = self
        
        for stringName in strings.keys {
            let string = strings[stringName]!
            
            for (fretIndex, fret) in string.enumerated() {
                fret.addTarget(self, action: #selector(pressFret(_:)), for: .touchUpInside)
                fret.name = "\(stringName)\(fretIndex+1)"
            }
        }
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
            return chords.count
        case variationChoice:
            return 1
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        switch pickerView {
        case chordChoice:
            return chords[row]
        case variationChoice:
            return variations[row]
        default:
            return nil
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView,
                             didSelectRow row: Int,
                             inComponent component: Int) {
        switch pickerView {
        case chordChoice:
            displayChord(chords[row])
        case variationChoice:
            print("Chose variation: \(variations[row])")
        default:
            print("Unrecognised picker view choice")
        }
    }

    func displayChord(_ name: String) {
        switch name {
        case "C Major":
            displayCChord()
        case "B Major", "D Major", "E Major", "F Major", "G Major", "A Major":
            clearAllStrings()
            for string in strings.values {
                for fret in string {
                    fret.activate()
                }
            }
        default:
            print("Unrecognised chord:")
        }
    }

    func displayCChord() {
        clearAllStrings()
        selectFret(a, 3)
        selectFret(d, 2)
        selectFret(b, 1)
    }

    func selectFret(_ string: [FretButton], _ fretNum: Int) {
        string[fretNum-1].backgroundColor = UIColor.red
    }

    func clearAllStrings() {
        for string in strings.values {
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


