//
//  ViewController.swift
//  CRM Manager
//
//  Created by ROHAN BHASIN on 16/06/20.
//  Copyright © 2020 ROHAN BHASIN. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, UINavigationControllerDelegate, GIDSignInDelegate {
    
    
@IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var LoginView: UIView!
    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self

        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
       
        if ((GIDSignIn.sharedInstance()?.hasPreviousSignIn()) != nil){
            print("signed in")
//            performSegue(withIdentifier: "Home_VC", sender: self)
            


        }


     
    
  


}
    
    // Retrieve user profile details from Google
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {

            // perform your log in functions here...
            // ex. assign user profile data to variables
            
            print(user.profile.email as Any)
            print(user.profile.givenName as Any)
            print(user.profile.familyName as Any)
       
            
            
            let controller = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "Home_VC") as! Home_VC
            controller.modalPresentationStyle = .fullScreen // this line use from ios 13
            self.present(controller, animated: true, completion: nil)  // use for model
          //  self.navigationController?.pushViewController(controller, animated: true) // use for push
            
            
            
            
            // Sign out of Google when logic completes for security purposes
         //   GIDSignIn.sharedInstance().signOut()

        } else {
            print(error.localizedDescription)
            
                 
        }
    }
    
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
        }
    }

}

