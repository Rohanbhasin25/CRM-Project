//
//  Menu_VC.swift
//  CRM Manager
//
//  Created by ROHAN BHASIN on 08/07/20.
//  Copyright © 2020 ROHAN BHASIN. All rights reserved.
//

import UIKit
import GoogleSignIn

enum MenuType:Int{
    
    case home
    case lead
    case contact
    case archiveLead
    case help
    case feedback
    case logout
    
}



class Menu_VC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        GIDSignIn.sharedInstance()?.presentingViewController = self

        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true){
            var viewClicked = "\(menuType)"
            print("\(menuType) Clicked")
            if (viewClicked == "logout"){
                
                let controller = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "initController") as! ViewController
                controller.modalPresentationStyle = .fullScreen // this line use from ios 13
                self.present(controller, animated: true, completion: nil)
                
                 GIDSignIn.sharedInstance().signOut()
                
            }
            
            }
        }
    }


