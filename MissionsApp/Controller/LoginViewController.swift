//
//  LoginViewController.swift
//  MissionsApp
//
//  Created by Rodolphe CELICA on 02/01/2018.
//  Copyright © 2018 Rodolphe CELICA. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn: Bool = true
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        //Change l'état du booléen
        isSignIn = !isSignIn
        //Vérifie l'état du booléen et modifie le bouton
        if isSignIn{
            signInButton.setTitle("Connexion", for: .normal)
        } else{
            signInButton.setTitle("Inscription", for: .normal)
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            //Vérifie la connexion au compte ou l'inscription
            if isSignIn {
                //Connexion de l'utilisateur à Firebase
                Services.sharedInstance.signIn(email: email, password: password, viewController: self)
            }else{
                //Inscription de l'utilisateur à Firebase
                Services.sharedInstance.signUp(email: email, password: password, viewController: self)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Enlève le clavier
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

