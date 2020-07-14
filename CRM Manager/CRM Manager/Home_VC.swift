//
//  Home_VC.swift
//  CRM Manager
//
//  Created by ROHAN BHASIN on 03/07/20.
//  Copyright © 2020 ROHAN BHASIN. All rights reserved.
//

import UIKit
import GoogleSignIn
import Kingfisher
import UserNotifications


class Home_VC: UIViewController, GIDSignInDelegate {

    @IBOutlet weak var setView: UIView!
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var dartView: UIView!
    @IBOutlet weak var meetView: UIView!
    @IBOutlet weak var congView: UIView!
    @IBOutlet weak var rockView: UIView!
    
    @IBOutlet weak var blueBox: UIImageView!
    @IBOutlet weak var welcome: UILabel!
    let transition = SlideInTransition()
    
    @IBOutlet weak var profileImg: UIImageView!
    
    var userName = "Not Found"
    
    
    
    
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

        graphView.styleView()
        rockView.styleView()
        meetView.styleView()
        congView.styleView()
        setView.styleView()
        dartView.styleView()
       
        
        var name = GIDSignIn.sharedInstance()?.currentUser.profile.givenName
        let url = GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: 50)?.absoluteString
        
        blueBox.layer.cornerRadius = 50
        blueBox.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        if (name == nil) {
            
            print("Name not found")
            name = "Alex"
        }
        
        welcome.text = "Hello " + name!
        func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
       profileImg.layer.cornerRadius = profileImg.frame.size.width/2
       profileImg.layer.masksToBounds = true
            profileImg.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            profileImg.layer.borderWidth = 3
   }
        viewDidLayoutSubviews()
        
        let Imgurl = URL(string:url! )
        profileImg.kf.setImage(with: Imgurl)

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
}
    
    @IBAction func hamburgerTap(_ sender: Any) {
        
        guard let menuVC = storyboard?.instantiateViewController(identifier: "Menu_VC") else { return }
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.transitioningDelegate = self
        present(menuVC, animated: true)
    }
    
}

extension Home_VC:UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
        
    }
}

extension UIView {
      func styleView(scale: Bool = true) {
          layer.masksToBounds = false
          layer.shadowColor = UIColor.black.cgColor
          layer.shadowOpacity = 0.2
          layer.shadowOffset = .zero
          layer.shadowRadius = 3
          layer.shouldRasterize = true
          layer.rasterizationScale = scale ? UIScreen.main.scale : 1
          layer.cornerRadius = 16.0
          layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      }
  }
