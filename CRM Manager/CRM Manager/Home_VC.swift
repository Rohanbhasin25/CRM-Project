//
//  Home_VC.swift
//  CRM Manager
//
//  Created by ROHAN BHASIN on 03/07/20.
//  Copyright © 2020 ROHAN BHASIN. All rights reserved.
//

import UIKit
import GoogleSignIn

class Home_VC: UIViewController, GIDSignInDelegate {

    @IBOutlet weak var blueBox: UIImageView!
    @IBOutlet weak var welcome: UILabel!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    var userName = "Alex"
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {

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

    
    override func viewDidLoad() {
        super.viewDidLoad()


        
       var name = GIDSignIn.sharedInstance()?.currentUser.profile.givenName
       var url = GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: 100)
  
        var path = url?.path
        print(path)
        blueBox.layer.cornerRadius = 50
        blueBox.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        welcome.text = "Hello " + name!
        
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
}
}
