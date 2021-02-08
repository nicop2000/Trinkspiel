/*
 *Projekt: Trinkspiel-App
 *Dateiname: WürfelnViewController.swift
 *Beschreibung: Würfel-Spielseite
 *Autor: Petersen, Nico
 *Erstellt: 07.01.2021
 */


import UIKit

class BeerpongViewController: UIViewController {
    var loggedIn = false
    var players: [String] = []
    var counter = 0
    var teamNumber = 1;

    @IBOutlet var teamHeadlineLbl: UILabel!
    @IBOutlet var teamLbl: UILabel!
    @IBOutlet var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        teamHeadlineLbl.text = "Team \(teamNumber)"
        teamNumber += 1
        teamLbl.text = "\(players[counter])\n\n\tmit\n\n\(players[counter + 1])"
        counter += 2
        if(counter >= players.count - 1) {
            nextBtn.alpha = 0
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setTexts() {
        
        if (counter >= players.count - 1) {
            
            
        } else {
            teamHeadlineLbl.text = "Team \(teamNumber)"
        teamNumber += 1
        teamLbl.text = "\(players[counter])\n\n\tmit\n\n\(players[counter + 1])"
        counter += 2
            if(counter >= players.count - 1) {
                nextBtn.alpha = 0
            }
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
