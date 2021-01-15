/*
 *Projekt: Trinkspiel-App
 *Dateiname: DealerViewController.swift
 *Beschreibung: Dealer-Spielseite
 *Autor: Petersen, Nico
 *Erstellt: 07.01.21
 */





import UIKit

class DealerViewController: UIViewController {
    
    
    @IBOutlet weak var ActualCard: UIImageView!
    var ramColor = 0
    var ramValue = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewRound(self)
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
        
        
        
        
        ActualCard.image = UIImage(named: cardString)
        
    }
    

}
