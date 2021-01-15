//
/*
 *Projekt: PRG-Labor
 *Dateiname: GamesDescription.swift
 *Beschreibung:
 *Autor: Petersen, Nico
 *Matrikelnummer: 937369
 *Erstellt: 06.01.21
 *Version:
 */



import UIKit

class GamesDescription: UITableViewCell {
    @IBOutlet weak var descriptionView: UIView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
