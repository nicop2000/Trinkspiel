/*
 *Projekt: Trinkspiel-App
 *Dateiname: ViewController.swift
 *Beschreibung: Startseite
 *Autor: Petersen, Nico
 *Erstellt: 02.01.2021
 */


//This code sucks, you know it and I know it.
//Move on and call me an idiot later.


/* safety pig
     _._ _..._ .-',     _.._(`))
    '-. `     '  /-._.-'    ',/
       )         \            '.
      / _    _    |             \
     |  a    a    /              |
     \   .-.                     ;
      '-('' ).-'       ,'       ;
         '-;           |      .'
            \           \    /
            | 7  .__  _.-\   \
            | |  |  ``/  /`  /
           /,_|  |   /,_/   /
              /,_/      '`-'

 */
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var DescriptionTableView: UITableView!
    @IBOutlet var explainTangeraWhilePlaying: UISwitch!
    @IBOutlet weak var gameDecision: UISegmentedControl!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var personalStatisticsButton: UIButton!
    @IBOutlet weak var shotCounterButton: UIButton!
    
    var games = ["Tangera", "Dealer", "Piccolo", "Bier-Pong"]
    var loggedIn = false
    var firstStart = true
    
    
    func openURL(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func TrinkgeldButton(_ sender: Any) {
        feedback()
    }
    

    @IBAction func PlayButton() {
        firstStart = false
        print("Pressed play")
        
        //Magic. Do not touch.
        let game = gameDecision.selectedSegmentIndex
        switch game {
        case 0:
            print("play Tangera")
            let vc = storyboard?.instantiateViewController(identifier: "TangeraViewController") as! TangeraViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.loggedIn = self.loggedIn
            if (explainTangeraWhilePlaying.isOn){
                vc.help = true
            } else {
                vc.help = false
            }
            break
            
        case 1:
            print("play Dealer")
            let vc = storyboard?.instantiateViewController(identifier: "DealerViewController") as! DealerViewController
            vc.loggedIn = self.loggedIn
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case 2:
            print("play Piccolo")
            let vc = storyboard?.instantiateViewController(identifier: "PiccoloViewController") as! PiccoloViewController
            vc.loggedIn = self.loggedIn
            self.navigationController?.pushViewController(vc, animated: true)
            vc.game = "Piccolo"
            break
            
        case 3:
            print("play Beerpong")
            let vc = storyboard?.instantiateViewController(identifier: "PiccoloViewController") as! PiccoloViewController
            vc.loggedIn = self.loggedIn
            vc.game = "Beerpong"
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        default:
            break
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(firstStart)
        print("EINGELOGGT? \(loggedIn)")
        if loggedIn {
            loginRoutine()
        }
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        gameDecision.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        DescriptionTableView.delegate = self
        DescriptionTableView.dataSource = self
        DescriptionTableView.separatorStyle = .singleLine
        DescriptionTableView.showsVerticalScrollIndicator = true
        
        gameDecision.removeAllSegments()
        var segmentCount = 0
        
        while (gameDecision.numberOfSegments != games.count) {
            gameDecision.insertSegment(withTitle: games[segmentCount], at: segmentCount, animated: true)
            segmentCount += 1
            
            if (loggedIn == false) {
                personalStatisticsButton.alpha = 0
                shotCounterButton.alpha = 0
            }
            
            if firstStart == true {
                
                let alert = UIAlertController(title: "Achtung", message: "Alkohol ist gesundheitsschädlich. Lasst euch von niemandem zum Trinken überreden, wenn ihr es nicht selber wollt. Durch das Bestätigen dieser Meldung, bestätigt ihr, dass ihr verantwortungsvoll mit Alkohol umgeht und für alle folgenden Ereignisse selbst verantwortlich seid. Die App ist nicht Schuld an eurem Verhalten und den Konsequenzen. Kennt euer Limit!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK – Verstanden: Fortfahren", style: .default, handler: { action in
                                                switch action.style{
                                                case .default:
                                                    print("default")
                                                    
                                                case .cancel:
                                                    print("cancel")
                                                case .destructive:
                                                    print("destructive")
                                                @unknown default:
                                                    print("error")
                                                }}))
                alert.addAction(UIAlertAction(title: "Abbrechen", style: .cancel, handler: { action in
                                                switch action.style{
                                                case .default:
                                                    print("default")
                                                    
                                                case .cancel:
                                                    print("cadncel")
                                                    exit(-1)
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                @unknown default:
                                                    print("error")
                                                }}))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func loginRoutine() {
        personalStatisticsButton.alpha = 1
        loginButton.alpha = 0
        signUpButton.alpha = 0
        shotCounterButton.alpha = 1
    }
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DescriptionViewController") as? DescriptionViewController
        vc?.game = indexPath.row
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DescriptionTableView.dequeueReusableCell(withIdentifier: "description") as! GamesDescription
        let game = games[indexPath.row]
        cell.descriptionLabel.text = game
        return cell
    }
    
    
    func feedback() {
        let alert = UIAlertController(title: "Gefällt Dir die App?", message: "Du kannst mir gerne ein Trinkgle hinterlassen :)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Jetzt Trinkgeld da lassen :)", style: .default, handler: { action in
                                        switch action.style{
                                        case .default:
                                            print("default")
                                            self.openURL(urlStr: "https://ko-fi.com/Trinkspiel")
                                        case .cancel:
                                            print("cancel")
                                        case .destructive:
                                            print("destructive")
                                        }}))
        alert.addAction(UIAlertAction(title: "Abbrechen", style: .cancel, handler: { action in
                                        switch action.style{
                                        case .default:
                                            print("default")
                                        case .cancel:
                                            print("cadncel")
                                        case .destructive:
                                            print("destructive")
                                            
                                        }}))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}



