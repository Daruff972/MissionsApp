//
//  AssoModel.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 11/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

class AssoModel{
    
    var id: String?
    var nom: String?
    var adresse: String?
    var codePostal: Int?
    var telephone: String?
    var email: String?
    var site: String?
    
    init(id: String?, nom: String?, adresse: String?, codePostal: Int?, telephone: String?, email: String?, site: String?){
        self.id=id
        self.nom = nom
        self.adresse = adresse
        self.codePostal = codePostal
        self.telephone = telephone
        self.email = email
        self.site = site
    }
}
