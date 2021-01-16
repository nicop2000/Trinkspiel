/*
 *Projekt: Trinkspiel-App
 *Dateiname: TangeraViewController.swift
 *Beschreibung: Tangera-Spielseite
 *Autor: Petersen, Nico
 *Erstellt: 07.01.2021
 */





import UIKit

class TangeraViewController: UIViewController {
    var help = false
    var cardsSkat: [String] = []
    var whichCard = ""
    @IBOutlet weak var DescriptionBottom: UILabel!
    @IBOutlet weak var DescriptionTop: UILabel!
    @IBOutlet weak var CardView: UIImageView!
    @IBOutlet weak var ButtonBottom: UIButton!
    @IBOutlet weak var ButtonTop: UIButton!
    @IBOutlet weak var EndLabel: UILabel!
    var round = 0
    
    
    
    
    
//    please work...
    func changeCard() {
        CardView.image = UIImage(named: cardsSkat[round])
        let value = cardsSkat[round].suffix(1)
        whichCard = String(value)
        switchDescription()
        if(help == true){
            DescriptionTop.text = DescriptionBottom.text
        }
        
    }
    
    func switchDescription() {
        
        if (help == true) {
            
            switch whichCard {
            case "1":
    //            Bube
                DescriptionBottom.text = "Pissbube: Du darfst auf Klo ohne trinken zu müssen.\nFalls noch jemand einen hat: Abgeben!"
                break
            case "2":
    //            Dame
                DescriptionBottom.text = "Neue Regel aufstellen"
                break
            case "3":
    //            König
                DescriptionBottom.text = "Kategorie auswählen und reihum Begriffe nennen"
                break
            case "4":
    //            Ass
                DescriptionBottom.text = "Augenkarte. Dem Spieler nicht mehr in die Augen gucken.\nFalls noch jemand eine hat: Abgeben!"
                break
            case "7":
                DescriptionBottom.text = "Zählen: Wenn Zahl 7, teilbar durch 7 oder Quersumme teilbar duch 7 ist: klatschen und Richtungswechsel. Bei Fehler: Trinken!"
                break
            case "8":
                DescriptionBottom.text = "Daumenkarte: Daumen unauffälig auf den Tisch legen.\nWer es zuletzt nachmacht, trinkt. Falls noch jemand eine hat: Abgeben!"
                break
            case "9":
                DescriptionBottom.text = "9 Schlücke verteilen, aber nur 3 pro Person"
                break
            default:
    //            10
                DescriptionBottom.text = "Schnell Klopfen: 2x Tisch, 2x Schulter, 1x Kopf"
                break
            }
        }
        
    }
    
    @IBAction func NextCardBottom(_ sender: Any) {
        if (round == 31) {
            DescriptionTop?.removeFromSuperview()
            DescriptionBottom?.removeFromSuperview()
            CardView.removeFromSuperview()
            ButtonTop.removeFromSuperview()
            ButtonBottom.removeFromSuperview()
            EndLabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
               // Code you want to be delayed
                self.goBack()
                
            }
            
            
        } else {
        round += 1
        changeCard()
        }
    }
    
    func goBack() {
        _ = navigationController?.popToRootViewController(animated: true)
        
    }
    @IBAction func NextCardTop() {
        NextCardBottom(self)
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        EndLabel.isHidden = true
        DescriptionTop.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        ButtonTop.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        
        
        
        
            for i in 1...4{
                let cardColorSkat = i
                for j in 7...14{
                    let cardValueSkat = j
                    let cardString = "\(cardColorSkat)-\(cardValueSkat)"
                    cardsSkat.append(cardString)
                }
            }
        cardsSkat.shuffle()
        cardsSkat.shuffle()
        cardsSkat.shuffle()
        CardView.image = UIImage(named: cardsSkat[0])
        let value = cardsSkat[0].suffix(1)
        whichCard = String(value)
        switchDescription()
        DescriptionTop.text = DescriptionBottom.text
            
            if (help == false) {
                DescriptionTop.removeFromSuperview()
                DescriptionBottom.removeFromSuperview()
                
            }
            
        
        //var games = ["Tangera", "Busfahrer", "Piccolo", "Würfeln"]
        //var cardsSkat: [String] = []

        // Do any additional setup after loading the view.
    }
    

    

}
