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
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
       
        if ((GIDSignIn.sharedInstance()?.hasPreviousSignIn()) != nil){
            print("signed in")
            performSegue(withIdentifier: "Trans", sender: self)
        }


     
    
  


}

}
