//
//  ViewController.swift
//  CRM Manager
//
//  Created by ROHAN BHASIN on 16/06/20.
//  Copyright © 2020 ROHAN BHASIN. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    
@IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var LoginView: UIView!
    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       GIDSignIn.sharedInstance()?.presentingViewController = self

            // Automatically sign in the user.
            GIDSignIn.sharedInstance()?.restorePreviousSignIn()

        LoginView.layer.cornerRadius = 4.0
        LoginButton.layer.cornerRadius = 4.0
        
    }
    
  


}

