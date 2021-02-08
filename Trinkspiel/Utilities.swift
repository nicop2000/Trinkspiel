//
/*
 *Projekt: PRG-Labor
 *Dateiname: Util.swift
 *Beschreibung:
 *Autor: Petersen, Nico
 *Matrikelnummer: 937369
 *Erstellt: 07.02.21
 *Version:
 */



import Foundation
import UIKit

class Utilities {
    
    static func styleTextFieldLoginAndSignUp(_ textfield:UITextField) {
        
        let bottomLine = CALayer()
        textfield.backgroundColor = UIColor.init(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 3)
        bottomLine.backgroundColor = UIColor.init(red: 130/255, green: 23/255, blue: 139/255, alpha: 1).cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        textfield.autocorrectionType = UITextAutocorrectionType.no
        textfield.textColor = .white
        
    }
    
    static func styleSubmitButton(_ button:UIButton) {
        
        
        button.layer.cornerRadius = 25.0
        button.layer.borderWidth = 2
        button.tintColor = UIColor.init(red: 242/255, green: 51/255, blue: 105/255, alpha: 1)
        button.layer.borderColor = UIColor.init(red: 242/255, green: 51/255, blue: 105/255, alpha: 1).cgColor
        
//        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.cornerRadius = 25.0
//        button.tintColor = UIColor.black
        
        
    }
    
}


