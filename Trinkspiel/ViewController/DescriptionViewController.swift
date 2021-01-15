/*
 *Projekt: Trinkspiel-App
 *Dateiname: DescriptionViewController.swift
 *Beschreibung: Zeigt Beschreibungen für Spiele
 *Autor: Petersen, Nico
 *Erstellt: 06.01.21
 */





import UIKit

class DescriptionViewController: UIViewController {
    var game = 0
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var DescriptionHeadline: UILabel!
    @IBOutlet weak var DescriptionText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
       ScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: DescriptionText.bottomAnchor).isActive = true
        switch game {
        case 0:
            DescriptionHeadline.text = "Tangera"
            DescriptionText.text = "Gespielt wird mit den Karten 7 bis Ass, also einem Skatblatt.\nBei Tangera werden nacheinander Karten umgedeckt.\nJe nachdem welche Karte offenliegt, müssen die Spieler eine bestimmte Aktion durchführen.\nHier die Erklärung zu den einzelnen Karten:\n\n7 – Es wird reihum durchgezählt, startend bei 1: also 1, 2, 3, ... Falls die Zahl aber die 7 enthält, die Quersumme oder die Zahl selbst durch 7 teilbar ist, muss statt die Zahl zu sagen, geklatscht werden. Dazu gibt's dann noch einen Richtungswechsel. Wer einen Fehler macht muss trinken!\n\n 8 – die Daumenkarte. Der Inhaber darf während er die Karte besitzt (unauffällig) seinen Daumen auf den Tisch legen. Wenn die Mitspieler es bemerken, legen sie ihren Daumen auch auf den Tisch. Der letzte muss trinken!\nGilt bis der nächste Spieler eine 8 zieht.\n\n 9 – 9 Schlücke an die Mitspieler verteilen. Aber nur 3 pro Person!\n\n 10 – Hier ist Schnelligkeit gefragt. Wird die Karte aufgedeckt, muss jeder mit der flachen Hand schnell 2x auf den Tisch, dann 2x auf die Schultern und abschließend 1x auf den Kopf kopfen. Wer zu langsam ist trinkt!\n\nBube – Der Pissbube. Nur wer diesen hat, darf auf Toilette gehen. Alle anderen, die auf Toiletten wollen müssen eine volle Mische austrinken!\n\nDame – Jetzt darf eine Regel erstellt werden, die das restliche Spiel gilt. Beispielsweise: Trinkpartner oder keine Namen mehr. Kreativität ist gefragt. Wer die Regel missachtet, muss trinken!\n\nKönig – Kategorie. Derjenige, der die Karte gezogen hat, bestimmt eine Kategorie und reihum müssen Begriffe dieser Kategorie genannt werden. Wer nichts mehr weiß oder etwas wiederholt, trinkt!\n\nAss – Die Augenkarte. Wer diese Karte besitzt, dem darf nicht mehr in die Augen geschaut werden, ansonsten: trinken!\nGilt bis der nächste Spieler ein Ass zieht.\n"
            break
        case 1:
            DescriptionHeadline.text = "Dealer"
            DescriptionText.text = "***Hier Beschreibung einfügen***"
            break
        case 2: DescriptionHeadline.text = "Piccolo"
            DescriptionText.text = "***Hier Beschreibung einfügen***"
            break
            
        default:
            DescriptionHeadline.text = "Würfeln"
            DescriptionText.text = "***Hier Beschreibung einfügen***"
            break
        }
        // Do any additional setup after loading the view.
    }
    

    

}
