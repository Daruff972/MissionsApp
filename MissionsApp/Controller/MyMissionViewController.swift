//
//  MyMissionViewController.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 22/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import Foundation
import UIKit

class MyMissionViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DataServices.sharedInstanceData.searchMyMissions(table: table)
        self.table.delegate = self
        self.table.dataSource = self
        
    }
}

//MARK: - UITableViewDataSource
extension MyMissionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.sharedInstanceData.mesMissions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMaMission = table.dequeueReusableCell(withIdentifier: "cellMyMission", for: indexPath) as! MyMissionTableViewCellController
        let theMission: MissionModel
        theMission = DataServices.sharedInstanceData.mesMissions[indexPath.row]
        cellMaMission.nom.text = theMission.nom
        cellMaMission.codePostal.text = String(theMission.codePostal!)
        cellMaMission.type.text = theMission.type
        cellMaMission.association.text = theMission.association
        return cellMaMission
    }
}

//MARK: - UITableViewDelegate
extension MyMissionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .normal, title: "Supprimer"){
            (rowAction, indexpath) in
            DataServices.sharedInstanceData.deleteMyMission(indice: indexPath,table: self.table,viewController: self)
        }
        deleteButton.backgroundColor = UIColor.red
        return [deleteButton]
    }
}
