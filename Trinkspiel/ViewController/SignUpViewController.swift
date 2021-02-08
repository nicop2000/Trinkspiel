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
import FirebaseDatabase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    var ref = Database.database(url:"https://trinkspiel-5be43-default-rtdb.europe-west1.firebasedatabase.app/").reference()

    @IBOutlet weak var scrollView: UIScrollView!
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
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height + 250)
            keyboardShown = true
        }
        
    }
    
    @objc func keyboardDisappear() {
        if keyboardShown {
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height - 250)
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
        
        firstName.alpha = 1
        lastName.alpha = 1
        emailSignUp.alpha = 1
        password.alpha = 1
        passwordRepeat.alpha = 1
        signUpButton.alpha = 1
        
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
            
            Auth.auth().createUser(withEmail: cleanEmailSignUp, password: cleanPassword) { [self] (result, err) in
                if err != nil {
                    
                    self.showError("Benutzer konnte nicht erstellt werden. " + err!.localizedDescription)
                    
                } else {
                    //Benutzer wurde erfolgreich erstellt
                    //Nutzerdaten speichern
                    let db = Firestore.firestore()
                    
                    db.collection("users").document("\(result!.user.uid)").setData(["Vorname":cleanFirstName, "Nachname":cleanLastName, "uid": result!.user.uid]){ (error) in
                        if error != nil {
                            self.showError("Account erfolgreich erstellt, jedoch konnten die Nutzerdaten nicht gespeichert werden" + error!.localizedDescription)
                            
                        }
                        
                        
                    }
                    
                    self.ref.child("users").child(result!.user.uid).setValue(["tangeraRoundsPlayed": 0, "dealerRoundsPlayed": 0, "piccoloRoundsPlayed": 0, "drunkenShots": 0])
                    
                    errorMsg.textColor = .green
                    errorMsg.text = "Registrierung erfolgreich. Du wirst weitergeleitet"
                    errorMsg.alpha = 1
                    firstName.alpha = 0
                    lastName.alpha = 0
                    emailSignUp.alpha = 0
                    password.alpha = 0
                    passwordRepeat.alpha = 0
                    signUpButton.alpha = 0
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self] in
                        let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") as! ViewController
                        
                        vc.loggedIn = true
                        vc.firstStart = false
                        
                        self.navigationController?.pushViewController(vc, animated: true)
                        guard let navigationController = self.navigationController else { return }
                        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
                        print(navigationArray)
                        let temp = navigationArray.last
                        navigationArray.removeAll()
                        navigationArray.append(temp!)
                        // To remove previous UIViewController
                        self.navigationController?.viewControllers = navigationArray
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
