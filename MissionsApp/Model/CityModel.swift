//
//  CityModel.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 05/02/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import Foundation
class CityModel{
    var id: Int?
    var code: Int?
    var ville: String?
    init(id: Int?, code: Int?, ville: String?){
        self.id=id
        self.code = code
        self.ville = ville
    }
}
