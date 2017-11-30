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
    
    @IBOutlet var e1: [UIButton]!
    @IBOutlet var a: [UIButton]!
    @IBOutlet var d: [UIButton]!
    @IBOutlet var g: [UIButton]!
    @IBOutlet var b: [UIButton]!
    @IBOutlet var e2: [UIButton]!
    
    var chords = [
        "C Major",
        "D Major",
        "E Major",
        "F Major",
        "G Major",
        "A Major",
        "B Major",
    ]
    
    var variations = [
        "One"
    ]
    
    var strings: [[UIButton]] {
        get {
            return [e1, a, d, g, b, e2]
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        chordChoice.dataSource = self
        chordChoice.delegate = self
        variationChoice.dataSource = self
        variationChoice.delegate = self
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
            print(strings)
            for string in strings {
                for fret in string {
                    fret.backgroundColor = UIColor.red
                }
            }
        default:
            print("Unrecognised chord: \(name)")
        }
    }

    func displayCChord() {
        clearAllStrings()
        selectFret(a, 3)
        selectFret(d, 2)
        selectFret(b, 1)
    }

    func selectFret(_ string: [UIButton], _ fretNum: Int) {
        print(fretNum)
        string[fretNum-1].backgroundColor = UIColor.red
    }

    func clearAllStrings() {
        for string in strings {
            clearString(string)
        }
    }

    func clearString(_ string: [UIButton]) {
        for fret in string {
            fret.backgroundColor = #colorLiteral(red: 0.8761691451, green: 0.5170841813, blue: 0.1610716283, alpha: 1)
        }
    }

    func initStrings() {
        clearAllStrings()
    }
}


