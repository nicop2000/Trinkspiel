//
/*
 *Projekt: TrinkspielApp
 *Dateiname: LoginViewController.swift
 *Beschreibung:
 *Autor: Petersen, Nico
 *Erstellt: 06.02.21
 *Version:
 */




import UIKit
import FirebaseAuth


class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func setUpElements() {
        errorMsg.alpha = 0
        emailLogin.attributedPlaceholder = NSAttributedString(string: "E-Mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordLogin.attributedPlaceholder = NSAttributedString(string: "Passwort", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordLogin.textContentType = UITextContentType.password
        passwordLogin.isSecureTextEntry = true
       
        
        
        Utilities.styleTextFieldLoginAndSignUp(emailLogin)
        
        Utilities.styleTextFieldLoginAndSignUp(passwordLogin)
        
        Utilities.styleSubmitButton(loginButton)
        
        self.emailLogin.delegate = self
        self.passwordLogin.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.emailLogin:
            self.passwordLogin.becomeFirstResponder()
        
        default:
                self.passwordLogin.resignFirstResponder()
            }
        }
    
    
    @IBAction func login(_ sender: Any) {
        
    
        let error = validateTextFields()
        
        if error != nil {
            self.showError(error!)
            
        } else {
            let cleanEmailLogin = emailLogin.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanPasswordLogin = passwordLogin.text!.trimmingCharacters(in: .newlines)
            Auth.auth().signIn(withEmail: cleanEmailLogin, password: cleanPasswordLogin) { (result, err) in
                if err != nil {
                    //Login fehlgeschlagen
                    self.showError(err!.localizedDescription)
                        
                    }
                
                }
            }
        
    
    }
    
    func validateTextFields() -> String? {
        errorMsg.alpha = 0
        
        let cleanEmailLogin = emailLogin.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanEmailLogin == "" {
            return "Bitte E-Mail ausfüllen!"
        }
        if Validators.isEmailValid(cleanEmailLogin!) == false {
            return "E-Mailadresse ist ungültig"
        }
        let cleanPasswordLogin = passwordLogin.text?.trimmingCharacters(in: .newlines)
        
        
        if cleanPasswordLogin == "" {
            return "Bitte Passwort ausfüllen!"
        }
        
        
        return nil
        
    }
    
    func showError(_ error:String) {
        errorMsg.text = error
        errorMsg.alpha = 1
        
    }
    

    

}

