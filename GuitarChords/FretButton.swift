//
//  FretButton.swift
//  GuitarChords
//
//  Created by  Robin Smith on 01/12/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import UIKit


@IBDesignable class FretButton: UIButton {
//    @IBInspectable var borderColor: UIColor = UIColor.white {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
//
//    @IBInspectable var borderWidth: CGFloat = 2.0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
    static let backgroundColors: [String: UIColor] = [
        "default": #colorLiteral(red: 0.8761883974, green: 0.5171511769, blue: 0.1612283289, alpha: 1),
        "activated": #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    ]
    
    public var name: String?
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func reset() {
        self.backgroundColor = FretButton.backgroundColors["default"]!
    }
    
    func activate() {
        self.backgroundColor = FretButton.backgroundColors["activated"]!
    }
}

