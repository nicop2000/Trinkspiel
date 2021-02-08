//
/*
 *Projekt: PRG-Labor
 *Dateiname: SettingsViewController.swift
 *Beschreibung:
 *Autor: Petersen, Nico
 *Matrikelnummer: 937369
 *Erstellt: 08.02.21
 *Version:
 */



import UIKit
import FirebaseAuth
import Firebase

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var oldEmail: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var newPasswordRepeat: UITextField!
    @IBOutlet weak var errMsg: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        oldPassword.alpha = 0
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        // Do any additional setup after loading the view.
    }
    
    var keyboardShown = false
    
    @objc func keyboardAppear() {
        if !keyboardShown {
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height + 300)
            keyboardShown = true
        }
        
    }
    
    @objc func keyboardDisappear() {
        if keyboardShown {
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height - 300)
        keyboardShown = false
        }
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.view.layoutIfNeeded()
        
        }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.oldEmail:
            self.newEmail.becomeFirstResponder()
        case self.oldPassword:
            self.newPassword.becomeFirstResponder()
        case self.newPassword:
            self.newPasswordRepeat.becomeFirstResponder()
        
            
        case self.newPasswordRepeat:
                self.newPasswordRepeat.resignFirstResponder()
        default:
                self.newEmail.resignFirstResponder()
            }
        }
    
   
        
   
    
    func setUpElements() {
        errMsg.alpha = 0
        oldEmail.attributedPlaceholder = NSAttributedString(string: "Alte E-Mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        newEmail.attributedPlaceholder = NSAttributedString(string: "Neue E-Mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        oldPassword.attributedPlaceholder = NSAttributedString(string: "Altes Passwort", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        newPassword.attributedPlaceholder = NSAttributedString(string: "Neues Passwort", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        newPasswordRepeat.attributedPlaceholder = NSAttributedString(string: "Neues Passwort wiederholen", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        oldPassword.textContentType = UITextContentType.password
        oldPassword.isSecureTextEntry = true
        newPassword.textContentType = UITextContentType.password
        newPassword.isSecureTextEntry = true
        newPasswordRepeat.textContentType = UITextContentType.password
        newPasswordRepeat.isSecureTextEntry = true
        
        Utilities.styleTextFieldLoginAndSignUp(oldEmail)
        Utilities.styleTextFieldLoginAndSignUp(newEmail)
        Utilities.styleTextFieldLoginAndSignUp(oldPassword)
        Utilities.styleTextFieldLoginAndSignUp(newPassword)
        Utilities.styleTextFieldLoginAndSignUp(newPasswordRepeat)
        
        
        self.oldPassword.delegate = self
        self.newPassword.delegate = self
        self.newPasswordRepeat.delegate = self
    
        
    }
    
    func showError(_ error: String, _ color: UIColor) {
        errMsg.text = error
        errMsg.textColor = .red
        errMsg.alpha = 1
    }
    
    
    @IBAction func changeMail(_ sender: Any) {
        let error = validateEmailChange()
        
        if error != nil {
            self.showError(error!, .red)
            
        } else {
            
        
        let cleanOldEmail = oldEmail.text!.trimmingCharacters(in: .newlines)
        let cleanNewEmail = newEmail.text!.trimmingCharacters(in: .newlines)
       
        
        
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                
                if let user = user {
                  
                  let emailGet = user.email
                
                    if (cleanOldEmail != emailGet?.trimmingCharacters(in: .whitespacesAndNewlines)) {
                        showError("Die eingegebene E-Mail stimmt nicht mit deiner alten E-Mail überein.", .red)
                        
                    } else if(cleanNewEmail == cleanOldEmail) {
                        showError("Dies ist bereits deine E-Mail!", .red)
                        
                    } else {
                        Auth.auth().currentUser!.updateEmail(to: cleanNewEmail) { [self] (error) in
                            if error != nil {
                                self.showError(error!.localizedDescription, .red)
                            } else {
                                showError("E-Mail erfolgreich geändert", .green)
                            }
                            
                        }
                    }
                    
                }
                
            } else {
                //No user signed in. -> Shouldn't be possible!
            }
            
        
    }
        
    }
    

    @IBAction func changePassword(_ sender: Any) {
        let error = validatePasswordChange()
        
        if error != nil {
            self.showError(error!, .red)
            
        } else {
            
        
        
//        let cleanOldPassword = oldPassword.text!.trimmingCharacters(in: .newlines)
        let cleanNewPassword = newPassword.text!.trimmingCharacters(in: .newlines)
        let cleanNewPasswordRepeat = newPasswordRepeat.text!.trimmingCharacters(in: .newlines)
        
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                
                if let user = user {
                  // The user's ID, unique to the Firebase project.
                  // Do NOT use this value to authenticate with your backend server,
                  // if you have one. Use getTokenWithCompletion:completion: instead.
                    Auth.auth().currentUser!.updatePassword(to: cleanNewPassword) { (error) in
                        if error != nil {
                            self.showError(error!.localizedDescription, .red)
                        } else {
                            self.showError("Passwort erfolgreich geändert.", .green)
                            
                            
                        }
                        
                        
                    }
                
                 
                }
                
            } else {
                //No user signed in. -> Shouldn't be possible!
            }
            
        
    }
    }
    
    
    
    
    
    
    
   func validatePasswordChange() -> String? {
//    let cleanOldPassword = oldPassword.text?.trimmingCharacters(in: .newlines)
    let cleanNewPassword = newPassword.text?.trimmingCharacters(in: .newlines)
    let cleanNewPasswordRepeat = newPasswordRepeat.text?.trimmingCharacters(in: .newlines)
    
    if /*cleanOldPassword == "" || */cleanNewPassword == "" || cleanNewPasswordRepeat == "" {
        return "Bitte alle Passwort-Felder ausfüllen"
    }
    
    if Validators.isPasswordValid(cleanNewPassword!) == false {
        
        return "Passwort entspricht nicht den Richtlinien."
    }
    
    if cleanNewPassword != cleanNewPasswordRepeat {
        return "Passwörter stimmen nicht überein."
    }

    
    
    
    return nil
    
    
        
    }
    
    func validateEmailChange() -> String? {
     let cleanOldEmail = oldEmail.text?.trimmingCharacters(in: .newlines)
     let cleanNewEmail = newEmail.text?.trimmingCharacters(in: .newlines)
        
        if cleanOldEmail == "" || cleanNewEmail == "" {
            return "Bitte alle E-Mail Felder ausfüllen"
            
        }
     
     
     if Validators.isEmailValid(cleanOldEmail!) == false {
         
         return "E-Mail ist ungültig."
     }
     
     
     
     
     return nil
     
     
         
     }
    

}
