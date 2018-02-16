
//
//  AssociationsViewController.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 10/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import Foundation
import UIKit

class AssociationsViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DataServices.sharedInstanceData.searchAllAsso(table: table)
        self.table.delegate = self
        self.table.dataSource = self
    }
}


//MARK: - UITableViewDataSource
extension AssociationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.sharedInstanceData.asso.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AssociationsTableViewCellController
        let monAsso: AssoModel
        monAsso = DataServices.sharedInstanceData.asso[indexPath.row]
        cell.nom.text = monAsso.nom
        cell.adresse.text = monAsso.adresse
        cell.codePostal.text = String(monAsso.codePostal!)
        cell.telephone.text = monAsso.telephone
        cell.email.text = monAsso.email
        cell.site.text = monAsso.site
        return cell
    }
}
