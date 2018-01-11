//
//  SecondViewController.swift
//  GuitarChords
//
//  Created by Robin Smith on 26/12/2017.
//  Copyright © 2017 Robin Smith. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var guitarTuningPicker: UIPickerView!
    @IBOutlet weak var toggleMajorChordsButton: UISwitch!
    @IBOutlet weak var toggleMinorChordsButton: UISwitch!
    @IBOutlet weak var toggleSharpChordsButton: UISwitch!
    
    var chordTypeToggles: [UISwitch] {
        get {
            return [
                self.toggleMajorChordsButton,
                self.toggleMinorChordsButton,
                self.toggleSharpChordsButton
            ]
        }
    }
    
    @IBOutlet weak var formError: UILabel!
    
    let guitarTunings = GuitarTuning.all
    
    var viewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guitarTuningPicker.dataSource = self
        guitarTuningPicker.delegate = self
        
        if let ctrl = self.tabBarController {
            if let ctrls = ctrl.viewControllers {
                self.viewController = ctrls[0] as? ViewController
            }
        }
        
        updateForm()
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
        case guitarTuningPicker:
            return self.guitarTunings.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        switch pickerView {
        case guitarTuningPicker:
            return self.guitarTunings[row].rawValue
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        switch pickerView {
        case guitarTuningPicker:
            UserDefaultsDAO.setGuitarTuning(tuning: self.guitarTunings[row])
            self.viewController!.guitarTuning = UserDefaultsDAO.getGuitarTuning()
        default:
            print("Unrecognised picker view choice")
        }
    }
    
    @IBAction func recalculateChords(_ sender: Any) {
//        ChordSaver().installChordPatterns()
        ChordSaver().installSharpChordPatterns()
    }
    
    @IBAction func toggleMajorChords(_ sender: Any) {
        UserDefaultsDAO.toggleShowMajorChords()
        self.viewController!.showMajorChords = UserDefaultsDAO.getShowMajorChords()
        self.updateForm()
    }
    
    @IBAction func toggleMinorChords(_ sender: Any) {
        UserDefaultsDAO.toggleShowMinorChords()
        self.viewController!.showMinorChords = UserDefaultsDAO.getShowMinorChords()
        self.updateForm()
    }
    
    @IBAction func toggleSharpChords(_ sender: Any) {
        UserDefaultsDAO.toggleShowSharpChords()
        self.viewController!.showSharpChords = UserDefaultsDAO.getShowSharpChords()
        self.updateForm()
    }
    
    @IBAction func resetToDefaults(_ sender: Any) {
        UserDefaultsDAO.resetToDefaults()
        self.viewController!.showMajorChords = UserDefaultsDAO.getShowMajorChords()
        self.viewController!.showMinorChords = UserDefaultsDAO.getShowMinorChords()
        self.viewController!.showSharpChords = UserDefaultsDAO.getShowSharpChords()
        self.viewController!.guitarTuning = UserDefaultsDAO.getGuitarTuning()
        
        updateForm()
    }
    
    func updateForm() {
        let moreThanOneChordTypeSelected = UserDefaultsDAO.getShowChordTypes().values.filter {$0 == true}.count > 1
        
        let guitarTuning = UserDefaultsDAO.getGuitarTuning()
        self.guitarTuningPicker.selectRow(self.guitarTunings.index(of: guitarTuning)!, inComponent: 0, animated: false)
        
        self.toggleMajorChordsButton.setOn(UserDefaultsDAO.getShowMajorChords(), animated: false)
        self.toggleMinorChordsButton.setOn(UserDefaultsDAO.getShowMinorChords(), animated: false)
        self.toggleSharpChordsButton.setOn(UserDefaultsDAO.getShowSharpChords(), animated: false)
        
        if !moreThanOneChordTypeSelected {
            for button in self.chordTypeToggles {
                if button.isOn {
                    button.isEnabled = false
                }
            }
        } else {
            for button in self.chordTypeToggles {
                button.isEnabled = true
            }
        }
    }
}

