/*
 *Projekt: Trinkspiel-App
 *Dateiname: PiccoloViewController.swift
 *Beschreibung: Piccolo-Spielseite
 *Autor: Petersen, Nico
 *Erstellt: 07.01.2021
 */




import UIKit

class PiccoloViewController: UIViewController, UITextFieldDelegate {
    var playernames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        hideAllNameFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return true
        }
    @IBAction func startPiccoloButton() {
        fillArrayPlayernames()
        if(player1Field.text != "" && player2Field.text != "" && player3Field.text != "") {
            
        
        while (playernames[playernames.count-1] == "") {
            playernames.remove(at: playernames.count-1)
        }
            let vc = storyboard?.instantiateViewController(identifier: "PiccoloGameViewController") as! PiccoloGameViewController
                vc.players = playernames
            self.navigationController?.pushViewController(vc, animated: true)
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
    
    //MARK: Declaration of field-actions
    
    @IBAction func p1Action(_ sender: Any) {
       let apF = player2Field!
        if(player1Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p2Action(_ sender: Any) {
       let apF = player3Field!
        if(player2Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p3Action(_ sender: Any) {
       let apF = player4Field!
        if(player3Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p4Action(_ sender: Any) {
       let apF = player5Field!
        if(player4Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p5Action(_ sender: Any) {
       let apF = player6Field!
        if(player5Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p6Action(_ sender: Any) {
       let apF = player7Field!
        if(player6Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p7Action(_ sender: Any) {
       let apF = player8Field!
        if(player7Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p8Action(_ sender: Any) {
       let apF = player9Field!
        if(player8Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p9Action(_ sender: Any) {
       let apF = player10Field!
        if(player9Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p10Action(_ sender: Any) {
       let apF = player11Field!
        if(player10Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p11Action(_ sender: Any) {
       let apF = player12Field!
        if(player11Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p12Action(_ sender: Any) {
       let apF = player13Field!
        if(player12Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p13Action(_ sender: Any) {
       let apF = player14Field!
        if(player13Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p14Action(_ sender: Any) {
       let apF = player15Field!
        if(player14Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p15Action(_ sender: Any) {
       let apF = player16Field!
        if(player15Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p16Action(_ sender: Any) {
       let apF = player17Field!
        if(player16Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p17Action(_ sender: Any) {
       let apF = player18Field!
        if(player17Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p18ction(_ sender: Any) {
       let apF = player19Field!
        if(player18Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p19Action(_ sender: Any) {
       let apF = player20Field!
        if(player19Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p20Action(_ sender: Any) {
       let apF = player21Field!
        if(player20Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p21Action(_ sender: Any) {
       let apF = player22Field!
        if(player21Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p22Action(_ sender: Any) {
       let apF = player23Field!
        if(player22Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p23Action(_ sender: Any) {
       let apF = player24Field!
        if(player23Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p24Action(_ sender: Any) {
       let apF = player25Field!
        if(player24Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p25Action(_ sender: Any) {
       let apF = player26Field!
        if(player25Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p26Action(_ sender: Any) {
       let apF = player27Field!
        if(player26Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p27Action(_ sender: Any) {
       let apF = player28Field!
        if(player27Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p28Action(_ sender: Any) {
       let apF = player29Field!
        if(player28Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }
    @IBAction func p29Action(_ sender: Any) {
       let apF = player30Field!
        if(player29Field.text != ""){
            apF.isHidden = false
        } else {
            apF.isHidden = true
            apF.text = ""
        }
    }



//MARK: preparing screen
    func hideAllNameFields() {

        player2Field.isHidden = true
        player3Field.isHidden = true
        player4Field.isHidden = true
        player5Field.isHidden = true
        player6Field.isHidden = true
        player7Field.isHidden = true
        player8Field.isHidden = true
        player9Field.isHidden = true
        player10Field.isHidden = true
        player11Field.isHidden = true
        player12Field.isHidden = true
        player13Field.isHidden = true
        player14Field.isHidden = true
        player15Field.isHidden = true
        player16Field.isHidden = true
        player17Field.isHidden = true
        player18Field.isHidden = true
        player19Field.isHidden = true
        player20Field.isHidden = true
        player21Field.isHidden = true
        player22Field.isHidden = true
        player23Field.isHidden = true
        player24Field.isHidden = true
        player25Field.isHidden = true
        player26Field.isHidden = true
        player27Field.isHidden = true
        player28Field.isHidden = true
        player29Field.isHidden = true
        player30Field.isHidden = true
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




