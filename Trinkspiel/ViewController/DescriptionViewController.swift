/*
 *Projekt: Trinkspiel-App
 *Dateiname: DescriptionViewController.swift
 *Beschreibung: Zeigt Beschreibungen für Spiele
 *Autor: Petersen, Nico
 *Erstellt: 06.01.2021
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
            DescriptionText.text = "Gespielt wird mit einem Skatblatt, also den Karten 7 bis Ass.\nBei Tangera werden nacheinander Karten umgedeckt.\nJe nachdem welche Karte offenliegt, müssen die Spieler eine bestimmte Aktion durchführen.\nHier die Erklärung zu den einzelnen Karten:\n\n7 – Es wird reihum durchgezählt, startend bei 1: also 1, 2, 3, ... Falls die Zahl aber die 7 enthält, die Quersumme oder die Zahl selbst durch 7 teilbar ist, muss statt die Zahl zu sagen, geklatscht werden. Zusätzlich gibt's es einen Richtungswechsel. Wer einen Fehler macht muss trinken!\n\n 8 – die Daumenkarte. Der Inhaber darf während er die Karte besitzt (unauffällig) seinen Daumen auf den Tisch legen. Wenn die Mitspieler es bemerken, legen sie ihren Daumen auch auf den Tisch. Der letzte muss trinken!\nGilt bis der nächste Spieler eine 8 zieht.\n\n 9 – 9 Schlücke an die Mitspieler verteilen. Aber nur 3 pro Person!\n\n 10 – Hier ist Schnelligkeit gefragt. Wird die Karte aufgedeckt, muss jeder mit der flachen Hand schnell 2x auf den Tisch, dann 2x auf die Brust und abschließend 1x auf den Kopf klopfen. Wer zu langsam ist trinkt!\n\nBube – Der Pissbube. Nur wer diesen hat, darf auf Toilette gehen. Alle anderen, die auf Toiletten wollen müssen eine volle Mische austrinken!\n\nDame – Jetzt darf eine Regel erstellt werden, die das restliche Spiel gilt. Beispielsweise: Trinkpartner wählen oder es dürfen keine Namen mehr genannt werden. Kreativität ist gefragt. Wer die Regel missachtet, muss trinken!\n\nKönig – Kategorie. Derjenige, der die Karte gezogen hat, bestimmt eine Kategorie und reihum müssen Begriffe dieser Kategorie genannt werden. Wer nichts mehr weiß oder etwas wiederholt, trinkt!\n\nAss – Die Augenkarte. Wer diese Karte besitzt, dem darf nicht mehr in die Augen geschaut werden, ansonsten: trinken!\nGilt bis der nächste Spieler ein Ass zieht.\n\nViel Spaß!\n\n\nVorschläge für neue Spiele gerne an mich per Mail: app.trinkspiel@t-online.de :D\n"
            break
        case 1:
            DescriptionHeadline.text = "Dealer"
            DescriptionText.text = "Eine Person ist zu Beginn der Dealer und befragt die Mitspieler reihum.\nDer Mitspieler nennt eine Kartenhöhe von 2 bis Ass.\nIst der genannte Wert der, der angezeigt wird, trinkt der Dealer 4 Schlucke. Falls der Wert nicht stimmte sagt der Dealer, ob die angezeigte Karte höher oder tiefer ist als der genannte Wert. Danach hat der Spieler einen zweiten Versuch die Karte zu erraten. Stimmt auch dieser Versuch nicht, muss der Spieler so viele Schlucke trinken, wie er daneben lag. Falls er jedoch die Karte richtig errät, trinkt der Dealer 2 Schlucke.\nWenn die Spieler es 3x hintereinander nicht schaffen, die Karte zu erraten. Ist der nächste Spieler dran.\n\nBeispiel 1:\nAngezeigte Karte ist die 10\nSpieler: Es ist eine Dame\nDealer: Niedriger\nSpieler:Neun\nDealer: Auch falsch, es war die Zehn -> Spieler trinkt 1 Schluck und der Counter wird um 1 hochgezählt\n\nBeispiel 2:\nAngezeigte Karte ist die 9\nSpieler: Es ist eine 9\nDealer: Richtig -> Dealer trinkt 4 Schlucke und Counter wird zurückgesetzt\n\nBeispiel3:\nAngezeigte Karte ist ein König\nSpieler: Es ist eine 8\nDealer: Höher\nSpieler:König\nDealer: Richtig -> Dealer trinkt 2 Schlucke und Counter wird zurückgesetzt\nViel Spaß!\n\n\nVorschläge für neue Spiele gerne an mich per Mail: app.trinkspiel@t-online.de :D\n"
            break
        case 2: DescriptionHeadline.text = "Piccolo"
            DescriptionText.text = "Es benötigt mindestens 3 Spieler. Die Rundenanzahl beträgt 30 Runden, sofern nichts anderes angegeben wird. Auf dem Bildschirm erscheinen Anweisungen, die befolgt werden müssen oder es wird getrunken. Die Anweisungen sind selbsterklärend.\nViel Spaß!\n\n\nVorschläge für neue Spiele gerne an mich per Mail: app.trinkspiel@t-online.de :D\n"
            break
            
        default:
            DescriptionHeadline.text = "Zu entwerfendes Spiel :D"
            DescriptionText.text = "***Hier Beschreibung einfügen*** Vorschläge gerne an mich per Mail: app.trinkspiel@t-online.de"
            break
        }
        // Do any additional setup after loading the view.
    }
    

    

}
