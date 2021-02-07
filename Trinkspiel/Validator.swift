//
/*
 *Projekt: PRG-Labor
 *Dateiname: Validator.swift
 *Beschreibung:
 *Autor: Petersen, Nico
 *Matrikelnummer: 937369
 *Erstellt: 07.02.21
 *Version:
 */



import Foundation
import UIKit

class Validators {
    
    static func isPasswordValid(_ password: String) -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[0-9])(?=.*[A-Z]).{6,}$")
        
        return passwordTest.evaluate(with: password)
        
    }
    
   static func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
}
