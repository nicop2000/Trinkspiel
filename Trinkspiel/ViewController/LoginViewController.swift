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

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        setUpElements()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
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
        
        loginButton.alpha = 1
        emailLogin.alpha = 1
        passwordLogin.alpha = 1
        
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
            Auth.auth().signIn(withEmail: cleanEmailLogin, password: cleanPasswordLogin) { [self] (result, err) in
                if err != nil {
                    //Login fehlgeschlagen
                    self.showError(err!.localizedDescription)
                        
                } else {
                    errorMsg.textColor = .green
                    errorMsg.text = "Login erfolgreich. Du wirst weitergeleitet"
                    errorMsg.alpha = 1
                    loginButton.alpha = 0
                    emailLogin.alpha = 0
                    passwordLogin.alpha = 0
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

