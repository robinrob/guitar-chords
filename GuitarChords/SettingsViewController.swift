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
    let guitarTunings = GuitarTuning.all
    
    var guitarTuning: GuitarTuning? = GuitarTuning.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guitarTuningPicker.dataSource = self
        guitarTuningPicker.delegate = self
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
            self.guitarTuning = self.guitarTunings[row]
            if let ctrl = self.tabBarController {
                if let ctrls = ctrl.viewControllers {
                    if let viewController = (ctrls[0] as? ViewController) {
                        viewController.guitarTuning = self.guitarTuning!
                        print("self.guitarTuning: \(self.guitarTuning!.rawValue)")
                    }
                }
            }
            print("HERE")
        default:
            print("Unrecognised picker view choice")
        }
    }
}

