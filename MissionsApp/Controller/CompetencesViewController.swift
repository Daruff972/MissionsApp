//
//  CompetencesViewController.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 15/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import Foundation
import UIKit


class CompetencesViewController: UIViewController {
    
    @IBOutlet weak var competenceUn: UITextField!
    @IBOutlet weak var competenceDeux: UITextField!
    @IBOutlet weak var competenceTrois: UITextField!
    @IBOutlet weak var listCompUn: UIPickerView!
    
    var listCompetences = ["Aide au déplacement","Collecte (argent, aliments...)","Distribution d'aliments, vêtements...","Vente.Commerce équitable","Travaux manuels","Responsable associatif. Coordinateur d'équipe","Gestion financière et comptable","Gestion administrative","Secrétariat, bureautique","Informatique. Web","Communication","Recherche de fonds, de partenaires","Documentation. Traduction","Chantiers environnement, patrimoine, humanitaire","Ecrivain public (Aide aux démarches administratives)","Accompagnement social. Maraude","Accueil, Information","Ecoute","Alphabétisation. Français Langue Etrangère","Accompagnement scolaire","Enseignement. Formation.","Animation culturelle","Animation sportive","Animation sportive","Secourisme. Santé. Soins","Visites en établissement","Visite à domicile","Conseil, Défense des droits","Autres actions"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DataServices.sharedInstanceData.competenceDisplay(competenceUn: self.competenceUn, competenceDeux: self.competenceDeux, competenceTrois: self.competenceTrois)
    }
    
    @IBAction func finToucheUn(_ sender: Any) {
        self.listCompUn.isHidden=true
    }
    
    @IBAction func toucheUn(_ sender: Any) {
        self.listCompUn.isHidden=false
    }
    
    @IBAction func toucheDeux(_ sender: Any) {
        self.listCompUn.isHidden=false
    }
    
    @IBAction func finToucheDeux(_ sender: Any) {
        self.listCompUn.isHidden=true
    }
    
    @IBAction func toucheTrois(_ sender: Any) {
        self.listCompUn.isHidden=false
    }
    
    @IBAction func finToucheTrois(_ sender: Any) {
        self.listCompUn.isHidden=true
    }
    
    @IBAction func updateUn(_ sender: Any) {
        DataServices.sharedInstanceData.updateCompetence(competence: "competence1", valeurAChanger: self.competenceUn.text!, viewController: self)
    }
    
    @IBAction func updateDeux(_ sender: Any) {
        DataServices.sharedInstanceData.updateCompetence(competence: "competence2", valeurAChanger: self.competenceDeux.text!, viewController: self)
    }
    
    @IBAction func updateTrois(_ sender: Any) {
        DataServices.sharedInstanceData.updateCompetence(competence: "competence3", valeurAChanger: self.competenceTrois.text!, viewController: self)
    }
}

//MARK: - UIPickerViewDataSource
extension CompetencesViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listCompetences.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listCompetences[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.competenceUn.isEditing{
            competenceUn.text = listCompetences[row]
        }else if self.competenceDeux.isEditing{
            competenceDeux.text = listCompetences[row]
        }
        else if self.competenceTrois.isEditing{
            competenceTrois.text = listCompetences[row]
        }
    }
}
