//
//  MyMissionTableViewCellController.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 22/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import Foundation
import UIKit

class MyMissionTableViewCellController: UITableViewCell {
    
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var codePostal: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var association: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
