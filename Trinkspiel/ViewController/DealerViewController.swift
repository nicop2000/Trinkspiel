/*
 *Projekt: Trinkspiel-App
 *Dateiname: DealerViewController.swift
 *Beschreibung: Dealer-Spielseite
 *Autor: Petersen, Nico
 *Erstellt: 07.01.2021
 */





import UIKit

class DealerViewController: UIViewController {
    
    
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
        labelNextOne.isHidden = true
        NextButton.isHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
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
            labelNextOne.isHidden = true
            NextButton.isHidden = true
            DealerCount = 0
            NewRound(self)
            
        } else if (answer == 0 && DealerCount < 3)
            {
            DealerCount = 0
                labelNextOne.isHidden = true
            NewRound(self)
            
        }
        DealerValue.text = "\(DealerCount)"
        if (DealerCount == 3) {
            labelNextOne.isHidden = false
            NextButton.isHidden = false
        }
        
        
        
    }
    

}
