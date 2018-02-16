//
//  Services.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 27/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import Foundation
import Firebase

class Services {
    
    static let sharedInstance = Services()
    
    private init() {}
    
    //###################################################################
    //###################################################################
    var currentUser: User? {
        guard let currentUser = Auth.auth().currentUser else {
            return nil
        }
        return currentUser
    }
    //###################################################################
    //###################################################################
    
    //Connexion de l'utilisateur
    func signIn(email: String,password: String, viewController: UIViewController){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            //Vérifie que l'utilisateur existe
            if user != nil {
                //utilisateur trouvé, nous allons à l'écran d'accueil
                viewController.performSegue(withIdentifier: "goToHome", sender: self)
                
            }else{
                //Erreur: vérifié l'erreur et nous montre l'erreur
                let alert = UIAlertController(title: "Erreur", message: error!.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                viewController.present(alert, animated: true)
            }
        }
    }
    
    //Création d'un nouvel utilisateur
    func signUp(email: String, password: String, viewController: UIViewController){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            //vérifie que l'utilisateur existe
            if user != nil {
                //utilisateur trouvé, nous allons à l'écran d'accueil
                viewController.performSegue(withIdentifier: "goToHome", sender: self)
                
            }else{
                
                //Erreur: vérifié l'erreur et nous montre l'erreur
                let alert = UIAlertController(title: "Erreur", message: error!.localizedDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                viewController.present(alert, animated: true)
            }
        }
    }
    
    
    //Déconnexion
    func signOut(viewController: UIViewController){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        //Retour au menu d'accueil
        viewController.performSegue(withIdentifier: "login", sender: nil)
        
    }
    

    
    
}
