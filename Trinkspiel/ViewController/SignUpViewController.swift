//
/*
 *Projekt: TrinkspielApp
 *Dateiname: SignUpViewController.swift
 *Beschreibung:
 *Autor: Petersen, Nico
 *Erstellt: 06.02.21
 *Version:
 */



import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailSignUp: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordRepeat: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
        
        
        
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.view.layoutIfNeeded()
        
        }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    func setUpElements() {
        errorMsg.alpha = 0
        firstName.attributedPlaceholder = NSAttributedString(string: "Vorname", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        lastName.attributedPlaceholder = NSAttributedString(string: "Nachname", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailSignUp.attributedPlaceholder = NSAttributedString(string: "E-Mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        password.attributedPlaceholder = NSAttributedString(string: "Passwort", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordRepeat.attributedPlaceholder = NSAttributedString(string: "Passwort wiederholen", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        password.textContentType = UITextContentType.password
        password.isSecureTextEntry = true
        passwordRepeat.textContentType = UITextContentType.password
        passwordRepeat.isSecureTextEntry = true
        
        Utilities.styleTextFieldLoginAndSignUp(emailSignUp)
        Utilities.styleTextFieldLoginAndSignUp(firstName)
        Utilities.styleTextFieldLoginAndSignUp(lastName)
        Utilities.styleTextFieldLoginAndSignUp(password)
        Utilities.styleTextFieldLoginAndSignUp(passwordRepeat)
        Utilities.styleSubmitButton(signUpButton)
        
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.emailSignUp.delegate = self
        self.password.delegate = self
        self.passwordRepeat.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.firstName:
            self.lastName.becomeFirstResponder()
        case self.lastName:
            self.emailSignUp.becomeFirstResponder()
        case self.emailSignUp:
            self.password.becomeFirstResponder()
        case self.password:
            self.passwordRepeat.becomeFirstResponder()
        default:
                self.passwordRepeat.resignFirstResponder()
            }
        }
    
    
    @IBAction func signUp(_ sender: Any) {
        let error = validateTextFields()
        
        if error != nil {
            self.showError(error!)
            
        } else {
            //Finale Versionen der Parameter
            let cleanFirstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanLastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let cleanEmailSignUp = emailSignUp.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanPassword = password.text!.trimmingCharacters(in: .newlines)
            
            //Benutzer erstellen
            
            Auth.auth().createUser(withEmail: cleanEmailSignUp, password: cleanPassword) { (result, err) in
                if err != nil {
                    
                    self.showError("Benutzer konnte nicht erstellt werden. " + err!.localizedDescription)
                    
                } else {
                    //Benutzer wurde erfolgreich erstellt
                    //Nutzerdaten speichern
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["Vorname":cleanFirstName, "Nachname":cleanLastName, "uid": result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("Account erfolgreich erstellt, jedoch konnten die Nutzerdaten nicht gespeichert werden" + error!.localizedDescription)
                            
                        }
                        
                        
                    }
                }
                
            }
        }
        
    }
    
    func validateTextFields() -> String? {
        errorMsg.alpha = 0
        let cleanEmailSignUp = emailSignUp.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanEmailSignUp == "" {
            return "Bitte E-Mail ausfüllen!"
        }
        if Validators.isEmailValid(cleanEmailSignUp!) == false {
            return "E-Mailadresse ist ungültig"
        }
        let cleanPassword = password.text?.trimmingCharacters(in: .newlines)
        let cleanPasswordRepeat = passwordRepeat.text?.trimmingCharacters(in: .newlines)
        if cleanPassword == "" {
            return "Bitte Passwort ausfüllen!"
        }
        if (Validators.isPasswordValid(cleanPassword!) == false){
            return "Passwort entspricht nicht den Richtlinien!"
        }
        if (cleanPassword != cleanPasswordRepeat) {
            return "Passwörter stimmen nicht überein!"
        }
        
        return nil
        
    }
    
    func showError(_ error:String) {
        errorMsg.text = error
        errorMsg.alpha = 1
        
    }

    


}
