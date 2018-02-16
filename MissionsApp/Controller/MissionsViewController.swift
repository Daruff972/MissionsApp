//
//  MissionsViewController.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 16/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import Foundation
import UIKit

class MissionsViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataServices.sharedInstanceData.searchAllMissions(table: self.table)
        self.table.delegate = self
        self.table.dataSource = self
    }
}

//MARK: - UITableViewDataSource
extension MissionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.sharedInstanceData.missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMission = table.dequeueReusableCell(withIdentifier: "cellMissions", for: indexPath) as! MissionsTableViewCellController
        let theMission: MissionModel
        theMission = DataServices.sharedInstanceData.missions[indexPath.row]
        cellMission.nom.text = theMission.nom
        cellMission.codePostal.text = String(theMission.codePostal!)
        cellMission.type.text = theMission.type
        cellMission.association.text = theMission.association
        
        return cellMission
    }
    
    //func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //    return true
    //}
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert{
           // DataServices.sharedInstanceData.addMission(indice: indexPath.row,viewController: self)
        }
    }
}

//MARK: - UITableViewDelegate
extension MissionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let addButton = UITableViewRowAction(style: .normal, title: "Ajouter"){
            (rowAction, indexpath) in
            DataServices.sharedInstanceData.addMission(indice: indexPath.row,viewController: self)
        }
        addButton.backgroundColor = UIColor.green
        return [addButton]
    }
}
