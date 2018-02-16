//
//  AssociationsTableViewCellController.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 11/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import UIKit

class AssociationsTableViewCellController: UITableViewCell {

    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var adresse: UILabel!
    @IBOutlet weak var codePostal: UILabel!
    @IBOutlet weak var telephone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var site: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
