/*
 *Projekt: Trinkspiel-App
 *Dateiname: PiccoloViewController.swift
 *Beschreibung: Piccolo-Spielseite
 *Autor: Petersen, Nico
 *Erstellt: 07.01.2021
 */




import UIKit
import FirebaseAuth
import Firebase


class PiccoloViewController: UIViewController, UITextFieldDelegate {
    var loggedIn = false
    var playernames: [String] = []
    var game = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
       
            hideAllNameFields()
        if(game == "Beerpong") {
            rundenanzahl.alpha = 0
        }
        
        if loggedIn {
            loginRoutine()
            
        }
        
    }
    
    func loginRoutine() {
        
        
            let user = Auth.auth().currentUser
                
        
//                self.ref.child("users").child(user.uid).setValue(["roundsPlayed": 12])
            
        let db = Firestore.firestore()

        let docRef = db.collection("users").document("\(user!.uid)")
        docRef.getDocument { (document, error) in
            
            if let document = document, document.exists {
               
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                
                var arrayNeeded = dataDescription.components(separatedBy: ",")
                var temp = ""
                for i in 0...arrayNeeded.count - 1 {
                    if arrayNeeded[i].contains("Vorname") {
                        temp = arrayNeeded[i]
                    }
                    
                }
                temp = temp.replacingOccurrences(of: "\"Vorname\": ", with: "")
                temp = temp.replacingOccurrences(of: "[", with: "")
                var insert = temp.replacingOccurrences(of: "]", with: "")
                print(insert)
                self.player1Field.text = insert
               
            
            }
        }
        

        
        
        player2Field.alpha = 1;
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return true
        }
    @IBAction func startPiccoloButton() {
        
        fillArrayPlayernames()
        if (game == "Piccolo") {
        if(player1Field.text != "" && player2Field.text != "" && player3Field.text != "") {
            
        
        while (playernames[playernames.count-1] == "") {
            playernames.remove(at: playernames.count-1)
        }
            let vc = storyboard?.instantiateViewController(identifier: "PiccoloGameViewController") as! PiccoloGameViewController
                vc.players = playernames
            vc.loggedIn = loggedIn
            
                vc.rundenanzahl = Int(rundenanzahl.text!) ?? 30
            
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        }
        if (game == "Beerpong") {
            if (playernames.count % 2 != 0) {
                print("Ungerade")
            } else {
                while (playernames[playernames.count-1] == "") {
                    playernames.remove(at: playernames.count-1)
                }
                let vc = storyboard?.instantiateViewController(identifier: "BeerpongViewController") as! BeerpongViewController
                vc.players = playernames;
                vc.loggedIn = loggedIn
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
   
    }
    
//MARK: I am sorry! - Lack of better ideas :(
    
 //MARK: Declaration of playername-fields
    @IBOutlet weak var player1Field: UITextField!
    @IBOutlet weak var player2Field: UITextField!
    @IBOutlet weak var player3Field: UITextField!
    @IBOutlet weak var player4Field: UITextField!
    @IBOutlet weak var player5Field: UITextField!
    @IBOutlet weak var player6Field: UITextField!
    @IBOutlet weak var player7Field: UITextField!
    @IBOutlet weak var player8Field: UITextField!
    @IBOutlet weak var player9Field: UITextField!
    @IBOutlet weak var player10Field: UITextField!
    @IBOutlet weak var player11Field: UITextField!
    @IBOutlet weak var player12Field: UITextField!
    @IBOutlet weak var player13Field: UITextField!
    @IBOutlet weak var player14Field: UITextField!
    @IBOutlet weak var player15Field: UITextField!
    @IBOutlet weak var player16Field: UITextField!
    @IBOutlet weak var player17Field: UITextField!
    @IBOutlet weak var player18Field: UITextField!
    @IBOutlet weak var player19Field: UITextField!
    @IBOutlet weak var player20Field: UITextField!
    @IBOutlet weak var player21Field: UITextField!
    @IBOutlet weak var player22Field: UITextField!
    @IBOutlet weak var player23Field: UITextField!
    @IBOutlet weak var player24Field: UITextField!
    @IBOutlet weak var player25Field: UITextField!
    @IBOutlet weak var player26Field: UITextField!
    @IBOutlet weak var player27Field: UITextField!
    @IBOutlet weak var player28Field: UITextField!
    @IBOutlet weak var player29Field: UITextField!
    @IBOutlet weak var player30Field: UITextField!
    @IBOutlet weak var rundenanzahl: UITextField!
    
    //MARK: Declaration of field-actions
    
    @IBAction func p1Action(_ sender: Any) {
       let apF = player2Field!
        if(player1Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p2Action(_ sender: Any) {
       let apF = player3Field!
        if(player2Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p3Action(_ sender: Any) {
       let apF = player4Field!
        if(player3Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p4Action(_ sender: Any) {
       let apF = player5Field!
        if(player4Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p5Action(_ sender: Any) {
       let apF = player6Field!
        if(player5Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p6Action(_ sender: Any) {
       let apF = player7Field!
        if(player6Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p7Action(_ sender: Any) {
       let apF = player8Field!
        if(player7Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p8Action(_ sender: Any) {
       let apF = player9Field!
        if(player8Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p9Action(_ sender: Any) {
       let apF = player10Field!
        if(player9Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p10Action(_ sender: Any) {
       let apF = player11Field!
        if(player10Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p11Action(_ sender: Any) {
       let apF = player12Field!
        if(player11Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p12Action(_ sender: Any) {
       let apF = player13Field!
        if(player12Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p13Action(_ sender: Any) {
       let apF = player14Field!
        if(player13Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p14Action(_ sender: Any) {
       let apF = player15Field!
        if(player14Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p15Action(_ sender: Any) {
       let apF = player16Field!
        if(player15Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p16Action(_ sender: Any) {
       let apF = player17Field!
        if(player16Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p17Action(_ sender: Any) {
       let apF = player18Field!
        if(player17Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p18ction(_ sender: Any) {
       let apF = player19Field!
        if(player18Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p19Action(_ sender: Any) {
       let apF = player20Field!
        if(player19Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p20Action(_ sender: Any) {
       let apF = player21Field!
        if(player20Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p21Action(_ sender: Any) {
       let apF = player22Field!
        if(player21Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p22Action(_ sender: Any) {
       let apF = player23Field!
        if(player22Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p23Action(_ sender: Any) {
       let apF = player24Field!
        if(player23Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p24Action(_ sender: Any) {
       let apF = player25Field!
        if(player24Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p25Action(_ sender: Any) {
       let apF = player26Field!
        if(player25Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p26Action(_ sender: Any) {
       let apF = player27Field!
        if(player26Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p27Action(_ sender: Any) {
       let apF = player28Field!
        if(player27Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p28Action(_ sender: Any) {
       let apF = player29Field!
        if(player28Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }
    @IBAction func p29Action(_ sender: Any) {
       let apF = player30Field!
        if(player29Field.text != ""){
            apF.alpha = 1
        } else {
            apF.alpha = 0
            apF.text = ""
        }
    }



//MARK: preparing screen
    func hideAllNameFields() {

        player2Field.alpha = 0
        player3Field.alpha = 0
        player4Field.alpha = 0
        player5Field.alpha = 0
        player6Field.alpha = 0
        player7Field.alpha = 0
        player8Field.alpha = 0
        player9Field.alpha = 0
        player10Field.alpha = 0
        player11Field.alpha = 0
        player12Field.alpha = 0
        player13Field.alpha = 0
        player14Field.alpha = 0
        player15Field.alpha = 0
        player16Field.alpha = 0
        player17Field.alpha = 0
        player18Field.alpha = 0
        player19Field.alpha = 0
        player20Field.alpha = 0
        player21Field.alpha = 0
        player22Field.alpha = 0
        player23Field.alpha = 0
        player24Field.alpha = 0
        player25Field.alpha = 0
        player26Field.alpha = 0
        player27Field.alpha = 0
        player28Field.alpha = 0
        player29Field.alpha = 0
        player30Field.alpha = 0
        player1Field.delegate = self
        player2Field.delegate = self
        player3Field.delegate = self
        player4Field.delegate = self
        player5Field.delegate = self
        player6Field.delegate = self
        player7Field.delegate = self
        player8Field.delegate = self
        player9Field.delegate = self
        player10Field.delegate = self
        player11Field.delegate = self
        player12Field.delegate = self
        player13Field.delegate = self
        player14Field.delegate = self
        player15Field.delegate = self
        player16Field.delegate = self
        player17Field.delegate = self
        player18Field.delegate = self
        player19Field.delegate = self
        player20Field.delegate = self
        player21Field.delegate = self
        player22Field.delegate = self
        player23Field.delegate = self
        player24Field.delegate = self
        player25Field.delegate = self
        player26Field.delegate = self
        player27Field.delegate = self
        player28Field.delegate = self
        player29Field.delegate = self
        player30Field.delegate = self
    }
    
//    MARK: get an array of players for use in PiccoloGameViewController

    func fillArrayPlayernames() {
        playernames = []
        if(player1Field.text != "") {
            playernames.append(player1Field.text ?? "")
        }
        if(player2Field.text != "") {
            playernames.append(player2Field.text ?? "")
        }
        if(player3Field.text != "") {
            playernames.append(player3Field.text ?? "")
        }
        if(player4Field.text != "") {
            playernames.append(player4Field.text ?? "")
        }
        if(player5Field.text != "") {
            playernames.append(player5Field.text ?? "")
        }
        if(player6Field.text != "") {
            playernames.append(player6Field.text ?? "")
        }
        if(player7Field.text != "") {
            playernames.append(player7Field.text ?? "")
        }
        if(player8Field.text != "") {
            playernames.append(player8Field.text ?? "")
        }
        if(player9Field.text != "") {
            playernames.append(player9Field.text ?? "")
        }
        if(player10Field.text != "") {
            playernames.append(player10Field.text ?? "")
        }
        if(player11Field.text != "") {
            playernames.append(player11Field.text ?? "")
        }
        if(player12Field.text != "") {
            playernames.append(player12Field.text ?? "")
        }
        if(player13Field.text != "") {
            playernames.append(player13Field.text ?? "")
        }
        if(player14Field.text != "") {
            playernames.append(player14Field.text ?? "")
        }
        if(player15Field.text != "") {
            playernames.append(player15Field.text ?? "")
        }
        if(player16Field.text != "") {
            playernames.append(player16Field.text ?? "")
        }
        if(player17Field.text != "") {
            playernames.append(player17Field.text ?? "")
        }
        if(player18Field.text != "") {
            playernames.append(player18Field.text ?? "")
        }
        if(player19Field.text != "") {
            playernames.append(player19Field.text ?? "")
        }
        if(player20Field.text != "") {
            playernames.append(player20Field.text ?? "")
        }
        if(player21Field.text != "") {
            playernames.append(player21Field.text ?? "")
        }
        if(player22Field.text != "") {
            playernames.append(player22Field.text ?? "")
        }
        if(player23Field.text != "") {
            playernames.append(player23Field.text ?? "")
        }
        if(player24Field.text != "") {
            playernames.append(player24Field.text ?? "")
        }
        if(player25Field.text != "") {
            playernames.append(player25Field.text ?? "")
        }
        if(player26Field.text != "") {
            playernames.append(player26Field.text ?? "")
        }
        if(player27Field.text != "") {
            playernames.append(player27Field.text ?? "")
        }
        if(player28Field.text != "") {
            playernames.append(player28Field.text ?? "")
        }
        if(player29Field.text != "") {
            playernames.append(player29Field.text ?? "")
        }
        if(player30Field.text != "") {
            playernames.append(player30Field.text ?? "")
        }
        


    }

}




