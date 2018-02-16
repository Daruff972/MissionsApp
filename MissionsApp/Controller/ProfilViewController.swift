//
//  ProfilViewController.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 04/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import UIKit


class ProfilViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var codePostal: UIPickerView!
    @IBOutlet weak var telephone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var disconnectButton: UIButton!
    
    let codePostaux = ["97200","97224","97232","97233"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Vérifie la session courante de l'utlisateur
//        Services.sharedInstance.reallyConnected(viewController: self)
        DataServices.sharedInstanceData.userDisplay(valeurLabel: label, valeurTelephone: telephone, valeurNom: nom, valeurPrenom: prenom, valeurAdresse: adress, valeurCodePostal: code, valeurEmail: email)
    }
    
    //###################################################################
    //###################################################################
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Services.sharedInstance.currentUser == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(loginViewController, animated: true, completion: nil)
        }
    }
    //###################################################################
    //###################################################################
    
    @IBAction func actionPostal(_ sender: Any) {
        self.codePostal.isHidden=true
    }
    
    @IBAction func actionCode(_ sender: Any) {
        self.codePostal.isHidden=false
    }
    
    @IBAction func updateNom(_ sender: Any) {
        DataServices.sharedInstanceData.udpdateUser(element: "nom",valeurAChanger: self.nom.text!, titreAlerte: "Nom actualisé", messageAlerte: "Votre nom est le: "+nom.text!, viewController: self)
    }
    
    @IBAction func updatePrenom(_ sender: Any) {
        DataServices.sharedInstanceData.udpdateUser(element: "prenom",valeurAChanger: self.prenom.text!, titreAlerte: "Prénom actualisé", messageAlerte: "Votre prénom est le: "+prenom.text!, viewController: self)
    }
    
    @IBAction func updatePassword(_ sender: Any) {
        DataServices.sharedInstanceData.updatePasswordUser(valeurAChanger: self.password.text!, titreAlerte: "Mot de passe actualisé", messageAlerte: "Votre mot de passe est le: "+self.password.text!, viewController: self)
    }
    
    @IBAction func updateTelephone(_ sender: Any) {
        DataServices.sharedInstanceData.udpdateUser(element: "telephone",valeurAChanger: self.telephone.text!, titreAlerte: "Téléphone actualisé", messageAlerte: "Votre téléphone est le: "+telephone.text!, viewController: self)
    }
    
    @IBAction func updateEmail(_ sender: Any) {
        DataServices.sharedInstanceData.updatePasswordUser(valeurAChanger: self.email.text!, titreAlerte: "Email actualisé", messageAlerte: "Votre email est le: "+self.email.text!, viewController: self)
    }
    
    @IBAction func updateAdress(_ sender: Any) {
        DataServices.sharedInstanceData.udpdateUser(element: "adresse",valeurAChanger: self.adress.text!, titreAlerte: "Adresse actualisée", messageAlerte: "Votre adresse est le: "+adress.text!, viewController: self)
    }
    
    @IBAction func updateCodePostal(_ sender: Any) {
        DataServices.sharedInstanceData.udpdateUser(element: "codepostal",valeurAChanger: self.code.text!, titreAlerte: "Code Postal actualisé", messageAlerte: "Votre code postal est le: "+code.text!, viewController: self)
    }
    
    @IBAction func seDeconnecter(_ sender: Any) {
        //Déconnexion
        Services.sharedInstance.signOut(viewController: self)
    }
}

//MARK: - UIPickerViewDataSource
extension ProfilViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return codePostaux.count

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return codePostaux[row]
        
    
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        code.text = codePostaux[row]
        
    }
}
