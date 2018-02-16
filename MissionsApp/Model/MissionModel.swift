//
//  MissionModel.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 16/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import Foundation
class MissionModel{
    
    var id: String?
    var nom: String?
    var codePostal: Int?
    var type: String?
    var association: String?
    
    init(id: String?,nom: String?, codePostal: Int?, type: String?, association: String?){
        self.id=id
        self.nom = nom
        self.codePostal = codePostal
        self.type = type
        self.association = association
    }
}
