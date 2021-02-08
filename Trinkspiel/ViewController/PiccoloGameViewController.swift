//
/*
 *Projekt: Trinkspiel-App
 *Dateiname: PiccoloGameViewController.swift
 *Beschreibung:
 *Autor: Petersen, Nico
 *Erstellt: 10.01.2021
 *
 */


import UIKit
import FirebaseDatabase
import FirebaseAuth

class PiccoloGameViewController: UIViewController {
    var ref = Database.database(url:"https://trinkspiel-5be43-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    var scores: [String] = []
    var loggedIn = false
    var players: [String] = []
    var instructions: [String] = []
    var virusInstructions: [String] = []
    
    var countInst = 0
    var rundenanzahl = 0
    var gespielt = 0
    
    @IBOutlet weak var ButtonLabelOutl: UIButton!
    
    func shouldAutorotate() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(rundenanzahl)
        validatePlayernames()
        setUpViewController()
        print("Start")
        prepareInstructions()
        
        ButtonLabelOutl.titleLabel?.textAlignment = .center
//        ButtonLabelOutl.titleLabel.textAlignment = NSTextAlignmentCenter
//        print(players)
//        print(instructions)

        
    }
    
    func validatePlayernames() {
        var doublePlayerCounter = 1
        for i in 0...players.count - 1 {
            print("i \(i)")
            print(players)
            if (i <= players.count - 2) {
                for j in (i + 1)...players.count - 1 {
                    print("j \(j)")
                    if(players[i] == players[j]) {
                        print("found")
                        print(players)
                        print(doublePlayerCounter)
                        doublePlayerCounter += 1
                        print(doublePlayerCounter)
                        players[j] = players[j] + "\(doublePlayerCounter)"
                        print(players)
                    }
                }
            }
            
        }
        
    }
    
    func setUpViewController() {
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        
     
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    

    func prepareInstructions() {
        var Str = ""
        // Catching exceptions is for communists
        do {
            let fileURLPiccolo = Bundle.main.path(forResource: "piccolo", ofType: "txt")
            
            Str = try String(contentsOfFile: fileURLPiccolo ?? "", encoding: String.Encoding.utf8)

        } catch _ as NSError {
         Str = ""
        }
        
        instructions = Str.components(separatedBy: ";")
//        print(instructions)
        instructions.shuffle()
        players.shuffle()
        let counter = instructions.count - 1
        for i in 0...counter {
            
            let instStr = instructions[i]
            var replaceXYZ = ""
            var replaceABC = ""
            var replaceDEF = ""
            
        
            func setReplacers() {
                let randomXYZ = Int.random(in: 0...players.count - 1)
                let randomABC = Int.random(in: 0...players.count - 1)
                let randomDEF = Int.random(in: 0...players.count - 1)
                replaceXYZ = players[randomXYZ]
                replaceABC = players[randomABC]
                replaceDEF = players[randomDEF]
                if((replaceXYZ == replaceABC) || (replaceXYZ == replaceDEF) || (replaceABC == replaceDEF)) {
                    
                setReplacers()
                }
            }
            setReplacers()
            var replaced = instStr.replacingOccurrences(of: "xyz", with: "\(replaceXYZ)")
            replaced = replaced.replacingOccurrences(of: "abc", with: "\(replaceABC)")
            replaced = replaced.replacingOccurrences(of: "def", with: "\(replaceDEF)")
            replaced = replaced.replacingOccurrences(of: "\n", with: "")
            instructions[i] = replaced
            
        
            
        

//        let counter = anweisungen.count - 1
//        for i in 0...counter{
//            let random = Int.random(in: 0...names.count-1)
//            let str = anweisungen[i]
//            let replace = names[random]
//            print(replace)
//
//            let testung = str.replacingOccurrences(of: "xyz", with: "\(replace)")
//            print(testung)
            
        }
        instructions.shuffle()
        players.shuffle()
        
        let firstInst = instructions[0]
        ButtonLabelOutl.setTitle("\(firstInst)", for: .normal)
        print("Ende")
        
        
    }
    
    func changeInstruction() {
        gespielt += 1
        countInst += 1
        
        print(instructions.count)
        print(countInst)
        if(countInst >= instructions.count || gespielt >= rundenanzahl) {
            print("Ende")
            if loggedIn {
            let user = Auth.auth().currentUser!
            self.ref.child("users").child(user.uid).observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as! NSDictionary
                for (key, value) in value {
                    self.scores.append("\(value)")
                }
                print(Int(self.scores[2])! + 1)
                self.ref.child("users").child(user.uid).setValue(["tangeraRoundsPlayed": Int(self.scores[3]),"dealerRoundsPlayed": Int(self.scores[0]),"piccoloRoundsPlayed": Int(self.scores[2])! + 1,"drunkenShots": Int(self.scores[1])])
            })
            }
            
            
            
            
            
            
            
            
            
            ButtonLabelOutl.setTitle("ENDE", for: .normal)
            if(countInst > instructions.count || gespielt > rundenanzahl) {
                _ = self.navigationController?.popToRootViewController(animated: true)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { // Change `2.0` to the desired number of seconds.
               // Code you want to be delayed
                _ = self.navigationController?.popToRootViewController(animated: true)
                
            }
        } else {
            let changedInst = instructions[countInst]
            if(changedInst == "") {
                changeInstruction()
            } else {
        ButtonLabelOutl.setTitle("\(changedInst)", for: .normal)
        }
        
    }
    }
    
    
    
    @IBAction func ButtonLabel(_ sender: Any) {
        changeInstruction()
        
    }
    
    @IBAction func ButtonLabelBack(_ sender: Any) {
        if(countInst >= 1) {
            countInst += -2
            gespielt -= 2
        }
        changeInstruction()
        
        
    }
    
}
