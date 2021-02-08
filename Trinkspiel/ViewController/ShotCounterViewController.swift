//
/*
 *Projekt: PRG-Labor
 *Dateiname: ShotCounterViewController.swift
 *Beschreibung:
 *Autor: Petersen, Nico
 *Matrikelnummer: 937369
 *Erstellt: 08.02.21
 *Version:
 */



import UIKit
import FirebaseAuth
import FirebaseDatabase

class ShotCounterViewController: UIViewController {
    var ref = Database.database(url:"https://trinkspiel-5be43-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    var scores: [String] = []
    var tempCount = 0;
    let user = Auth.auth().currentUser!
    var timer: Timer!
        
       
    @IBOutlet weak var shots: UILabel!
    
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            shots.alpha = 0
            getNewValue()
            timer = Timer.scheduledTimer(timeInterval: 9.0, target: self, selector: #selector(pushNewShotCount), userInfo: nil, repeats: true)
            
//            var updateTimer = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: "pushNewShotCount", userInfo: nil, repeats: true)
            
            
            

            // Do any additional setup after loading the view.
        }
    
    @IBAction func minusBtn(_ sender: Any) {
        tempCount += 1
        let temp = Int(shots.text!)
        if(temp! - tempCount >= 0) {
        shots.text = "\(temp! - tempCount)"
        }
        tempCount = 0
            
        
        
        
    }
    
    @IBAction func plusBtn(_ sender: Any) {
        tempCount += 1
        let temp = Int(shots.text!)
        shots.text = "\(temp! + tempCount)"
        tempCount = 0
        
    }
    
    func getNewValue() {
        self.ref.child("users").child(user.uid).observeSingleEvent(of: .value, with: {(snapshot) in
        let value = snapshot.value as! NSDictionary
            for (key, value) in value {
                self.scores.append("\(value)")
            }
            self.shots.text = "\(Int(self.scores[1])!)"
            self.shots.alpha = 1
        
    })
        }
    
    
    
        
    
    @objc func pushNewShotCount(){
        print("activated")
        
        self.ref.child("users").child(user.uid).observeSingleEvent(of: .value, with: {(snapshot) in
        let value = snapshot.value as! NSDictionary
            for (key, value) in value {
                self.scores.append("\(value)")
            }
            
            self.ref.child("users").child(self.user.uid).setValue(["tangeraRoundsPlayed": Int(self.scores[3]),"dealerRoundsPlayed": Int(self.scores[0]),"piccoloRoundsPlayed": Int(self.scores[2]),"drunkenShots": Int(self.shots.text!)])
        })
        
        
        
        
        
        
        
            
        }
        
    }
        
      
        

