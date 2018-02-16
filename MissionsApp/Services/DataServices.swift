//
//  DataServices.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 27/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import Foundation
import Firebase

class DataServices {
    
    static let sharedInstanceData = DataServices()
    private init() {}
    
    let user = Auth.auth().currentUser
    var ref : DatabaseReference!
    var ref1 : DatabaseReference!
    var missions = [MissionModel]()
    var asso = [AssoModel]()
    var mesMissions = [MissionModel]()
    var codesPostaux = [CityModel]()
    
    func udpdateUser(element: String,valeurAChanger: String, titreAlerte: String, messageAlerte: String, viewController: UIViewController){
        
        ref = Database.database().reference()
        self.ref?.child("benevoles").child((user?.uid)!).updateChildValues([element : valeurAChanger])
        let alert = UIAlertController(title: titreAlerte, message: messageAlerte, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController.present(alert, animated: true)
    }
    
    func updatePasswordUser(valeurAChanger: String, titreAlerte: String, messageAlerte: String, viewController: UIViewController){
        let user = Auth.auth().currentUser
        user?.updatePassword(to: valeurAChanger) { (error) in
            if let error = error {
                let alert = UIAlertController(title: "Erreur", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                viewController.present(alert, animated: true)
                
            }else{
                let alert = UIAlertController(title: titreAlerte, message: messageAlerte, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                viewController.present(alert, animated: true)
            }
        }
    }
    
    func updateEmailUser(valeurAChanger: String, titreAlerte: String, messageAlerte: String, viewController: UIViewController){
        let user = Auth.auth().currentUser
        user?.updateEmail(to: valeurAChanger) { (error) in
            if let error = error {
                let alert = UIAlertController(title: "Erreur", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                viewController.present(alert, animated: true)
                
            }else{
                let alert = UIAlertController(title: titreAlerte, message: messageAlerte, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                viewController.present(alert, animated: true)
            }
        }
    }
    
    func userDisplay(valeurLabel: UILabel, valeurTelephone: UITextField, valeurNom: UITextField, valeurPrenom: UITextField, valeurAdresse: UITextField, valeurCodePostal: UITextField, valeurEmail: UITextField){
        let user = Auth.auth().currentUser
        if let user = user {
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            let uid  = user.uid
            let email = user.email
            
            // ...
            
            ref = Database.database().reference()
            ref?.child("benevoles").child(uid).observe(.value, with: {(snapshot) in
                
                let benevole = snapshot.value as? [String: AnyObject] ?? [:]
                
                if ((benevole["telephone"] as? String) != "") {
                    valeurTelephone.text = benevole["telephone"] as? String
                }
                
                if ((benevole["nom"] as? String) != "") {
                    valeurNom.text = benevole["nom"] as? String
                    
                    
                }
                
                if ((benevole["prenom"] as? String) != "") {
                    valeurPrenom.text = benevole["prenom"] as? String
                    valeurLabel.text = valeurPrenom.text! + " " + valeurNom.text!
                    
                }else{
                    valeurLabel.text = email
                }
                
                if ((benevole["adresse"] as? String) != "") {
                    valeurAdresse.text = benevole["adresse"] as? String
                }
                if ((benevole["codepostal"] as? String) != "") {
                    valeurCodePostal.text = benevole["codepostal"] as? String
                }
            })
            
            valeurEmail.text = email
    
        }
    }
    
    func updateCompetence(competence: String, valeurAChanger: String, viewController: UIViewController){
        let user = Auth.auth().currentUser
        ref = Database.database().reference()
        self.ref?.child("benevoles").child((user?.uid)!).updateChildValues([competence : valeurAChanger])
        let alert = UIAlertController(title: "Compétence actualisée", message: "Votre compétence est le: " + valeurAChanger, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController.present(alert, animated: true)
    }
    
    func competenceDisplay(competenceUn: UITextField, competenceDeux: UITextField, competenceTrois: UITextField){
        let user = Auth.auth().currentUser
        if let user = user {
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            let uid  = user.uid
            
            // ...
            
            ref = Database.database().reference()
            ref?.child("benevoles").child(uid).observe(.value, with: {(snapshot) in
                
                let benevole = snapshot.value as? [String: AnyObject] ?? [:]
                
                if ((benevole["competence1"] as? String) != "") {
                    competenceUn.text = benevole["competence1"] as? String
                }
                
                if ((benevole["competence2"] as? String) != "") {
                    competenceDeux.text = benevole["competence2"] as? String
                }
                
                if ((benevole["competence3"] as? String) != "") {
                    competenceTrois.text = benevole["competence3"] as? String
                }
                
            })
        }
    }
    
    func searchAllMissions(table: UITableView){
        ref = Database.database().reference()
        ref?.child("missions").observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount>0{
                self.missions.removeAll()
                for lamission in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let missionObject = lamission.value as? [String: AnyObject]
                    let nomMission = missionObject?["nom"]
                    let codePostalMission = missionObject?["codePostal"]
                    let typeMission = missionObject?["type"]
                    let nomAssociation = missionObject?["association"]
                    let idMission = missionObject?["idMission"]
                    
                    
                    
                    
                    let theMission = MissionModel(id: idMission as! String?,nom: nomMission as! String?, codePostal: codePostalMission as! Int?, type: typeMission as! String?, association: nomAssociation as! String?)
                    self.missions.append(theMission)
                    
                }
                table.reloadData()
            }
        })
    }
    
    func addMission(indice: Int,viewController: UIViewController){
        let mamission = missions[indice]
        let user = Auth.auth().currentUser
        let nom = mamission.nom
        let codePostal = mamission.codePostal
        let type = mamission.type
        let association = mamission.association
        let idMission = mamission.id
            self.ref?.child("benevoles").child((user?.uid)!).child("missions").child((idMission)!).updateChildValues(["idMission": idMission!, "nomMission": nom!, "codePostalMission": codePostal!, "association": association!,"type": type!])
            self.ref1?.child("missions").child((idMission)!).child("benevoles").child((user?.uid)!).updateChildValues(["uid": (user?.uid)!, "email": (user?.email)!])
        let alert = UIAlertController(title: "Mission ajoutée", message: "Veuillez entrer dans votre espace Mes Missions!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController.present(alert, animated: true)
        
    }
    
    func searchAllAsso(table: UITableView){
        ref = Database.database().reference()
        ref?.child("associations").observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount>0{
                self.asso.removeAll()
                for monasso in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let assoObject = monasso.value as? [String: AnyObject]
                    let adresseAsso = assoObject?["adresse"]
                    let codePostalAsso = assoObject?["codepostal"]
                    let emailAsso = assoObject?["email"]
                    let nomAsso = assoObject?["nom"]
                    let siteAsso = assoObject?["site"]
                    let telephoneAsso = assoObject?["telephone"]
                    let idAsso = assoObject?["idAssociation"]
                    
                    
                    
                    let association = AssoModel(id: idAsso as! String?, nom: nomAsso as! String?, adresse: adresseAsso as! String?, codePostal: codePostalAsso as! Int?, telephone: telephoneAsso as! String?, email: emailAsso as! String?, site: siteAsso as! String?)
                    
                    self.asso.append(association)
                    
                }
                table.reloadData()
            }
        })
    }
    
    func searchMyMissions(table: UITableView){
        let user = Auth.auth().currentUser
        ref = Database.database().reference()
        ref?.child("benevoles").child((user?.uid)!).child("missions").observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount>0{
                self.mesMissions.removeAll()
                for lamission in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let missionObject = lamission.value as? [String: AnyObject]
                    let nomMission = missionObject?["nomMission"]
                    let codePostalMission = missionObject?["codePostalMission"]
                    let typeMission = missionObject?["type"]
                    let nomAssociation = missionObject?["association"]
                    let idMission = missionObject?["idMission"]
                    
                    
                    
                    let theMission = MissionModel(id: idMission as! String?,nom: nomMission as! String?, codePostal: codePostalMission as! Int?, type: typeMission as! String?, association: nomAssociation as! String?)
                    
                    self.mesMissions.append(theMission)
                    
                }
                table.reloadData()
            }
        })
    }
    
    func deleteMyMission(indice: IndexPath, table: UITableView, viewController: UIViewController){
        let user = Auth.auth().currentUser
        let b: MissionModel
        b = self.mesMissions[indice.row]
        if mesMissions.count == 1 {
            self.ref?.child("benevoles").child((user?.uid)!).child("missions").child((b.id)!).removeValue()
            self.ref?.child("missions").child((b.id)!).child("benevoles").child((user?.uid)!).removeValue()
            mesMissions.removeAll()
        }else{
            self.ref?.child("benevoles").child((user?.uid)!).child("missions").child((b.id)!).removeValue()
            self.ref?.child("missions").child((b.id)!).child("benevoles").child((user?.uid)!).removeValue()
        }
        table.reloadData()
        let alert = UIAlertController(title: "Mission effacée", message: "N'hésitez pas à en sélectionner une autre", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController.present(alert, animated: true)
    }
    
    
}
