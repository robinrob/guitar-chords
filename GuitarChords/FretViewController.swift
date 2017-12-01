//
//  FretViewController.swift
//  GuitarChords
//
//  Created by  Robin Smith on 30/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import UIKit

@IBDesignable class FretViewController: UIViewController {
    @IBOutlet weak var fret: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        clearFret()
    }
    
    func clearFret() {
        fret.backgroundColor = #colorLiteral(red: 0.8761691451, green: 0.5170841813, blue: 0.1610716283, alpha: 1)
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIButton
        
        return view
    }
}

