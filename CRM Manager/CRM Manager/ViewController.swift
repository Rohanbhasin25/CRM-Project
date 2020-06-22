//
//  ViewController.swift
//  CRM Manager
//
//  Created by ROHAN BHASIN on 16/06/20.
//  Copyright © 2020 ROHAN BHASIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LoginView: UIView!
    @IBOutlet weak var GmailButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        LoginView.layer.cornerRadius = 4.0
        LoginButton.layer.cornerRadius = 4.0
        GmailButton.layer.cornerRadius = 4.0
    }


}

