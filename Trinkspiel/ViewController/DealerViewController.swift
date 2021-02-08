/*
 *Projekt: Trinkspiel-App
 *Dateiname: DealerViewController.swift
 *Beschreibung: Dealer-Spielseite
 *Autor: Petersen, Nico
 *Erstellt: 07.01.2021
 */





import UIKit
import FirebaseAuth
import FirebaseDatabase

class DealerViewController: UIViewController {
    var loggedIn = false
    var ref = Database.database(url:"https://trinkspiel-5be43-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    var scores: [String] = []
    
    @IBOutlet weak var ActualCard: UIImageView!
    var ramColor = 0
    var ramValue = 0
    var DealerCount = 0
    
    
    @IBOutlet weak var DealerValue: UILabel!
    
    @IBOutlet weak var labelNextOne: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewRound(self)
        labelNextOne.alpha = 0
        NextButton.alpha = 0
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        if loggedIn {
        let user = Auth.auth().currentUser!
        self.ref.child("users").child(user.uid).observeSingleEvent(of: .value, with: {(snapshot) in
        let value = snapshot.value as! NSDictionary
            for (key, value) in value {
                self.scores.append("\(value)")
            }
            self.ref.child("users").child(user.uid).setValue(["tangeraRoundsPlayed": Int(self.scores[3]),"dealerRoundsPlayed": Int(self.scores[0])! + 1,"piccoloRoundsPlayed": Int(self.scores[2]),"drunkenShots": Int(self.scores[1])])
        })
        }
        
    }
    
    @IBAction func NewRound(_ sender: Any) {
        
        var cardColor = Int.random(in: 1...4)
        var cardValue = Int.random(in: 2...14)
        if(cardColor == ramColor && cardValue == ramValue) {
            cardColor = Int.random(in: 1...4)
            cardValue = Int.random(in: 2...14)
            print("changed")
            
        }
        
        let cardString = "\(cardColor)-\(cardValue)"
        ramColor = cardColor
        ramValue = cardValue
        
        
        
//        if (DealerCount == 3) {
//            updateValue(answer: 2)
//        }
        ActualCard.image = UIImage(named: cardString)
        
    }
    
    //MARK - Written under alcohol, validate later
    
    @IBAction func nextDealer() {
        updateValue(answer: 2)
        
    }
    
    @IBAction func rightButton(_ sender: Any) {
        updateValue(answer: 1)
    }
    
    
    @IBAction func wrongButton(_ sender: Any) {
        updateValue(answer: 0)
    }
    
    func updateValue(answer: Int) {
        if (answer == 1 && DealerCount < 3) {
            DealerCount += 1
            NewRound(self)
        } else if (answer == 2) {
            labelNextOne.alpha = 0
            NextButton.alpha = 0
            DealerCount = 0
            NewRound(self)
            
        } else if (answer == 0 && DealerCount < 3)
            {
            DealerCount = 0
                labelNextOne.alpha = 0
            NewRound(self)
            
        }
        DealerValue.text = "\(DealerCount)"
        if (DealerCount == 3) {
            labelNextOne.alpha = 1
            NextButton.alpha = 1
        }
        
        
        
    }
    

}
