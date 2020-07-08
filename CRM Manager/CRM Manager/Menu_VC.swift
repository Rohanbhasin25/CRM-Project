//
//  Menu_VC.swift
//  CRM Manager
//
//  Created by ROHAN BHASIN on 08/07/20.
//  Copyright © 2020 ROHAN BHASIN. All rights reserved.
//

import UIKit

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
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true){
            print("\(menuType) Clicked")
        }
    }

}
