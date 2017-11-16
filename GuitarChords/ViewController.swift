//
//  ViewController.swift
//  GuitarChords
//
//  Created by  Robin Smith on 10/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var e1: [UIButton]!
    @IBOutlet var a: [UIButton]!
    @IBOutlet var d: [UIButton]!
    @IBOutlet var g: [UIButton]!
    @IBOutlet var b: [UIButton]!
    @IBOutlet var e2: [UIButton]!
//
    var strings: [[UIButton]] {
        get {
//            return [e1, a, d, g, b, e2]
            return [e1]
        }
    }
//
//    var isCSelected: Bool = false
//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        initStrings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showChord(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
            let name = sender.currentTitle!
            displayChord(name)
        } else {
            sender.isSelected = false
            clearAllStrings()
        }
    }

    func displayChord(_ name: String) {
        print("here")
        if name == "C" {
            displayCChord()
        } else {
            print(strings)
            for string in strings {
                for fret in string {
                    fret.backgroundColor = UIColor.red
                }
            }
        }
    }

    func displayCChord() {
//        for fret in e1 {
//            fret.backgroundColor = UIColor.gray
//        }
//        selectFret(a, 3)
//        selectFret(d, 2)
//        selectFret(b, 1)

        print(e1)
        selectFret(e1, 14)
//        selectFret(a, 1)
//        selectFret(d, 1)
//        selectFret(g, 1)
//        selectFret(b, 1)
//        selectFret(e2, 1)
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


