//
//  LoginModel.swift
//  CRM Manager
//
//  Created by ROHAN BHASIN on 08/07/20.
//  Copyright © 2020 ROHAN BHASIN. All rights reserved.
//

import UIKit

class LoginModel: Decodable {
    
    var key:String?
    var value:String?
    var type:String?
    
    
    init(key:String?,value:String?,type:String? ) {
        self.key = key
        self.value = value
        self.type = type
    }

}

class objectModel:Decodable{
    
    var objects = [LoginModel]()
    init(objects:[LoginModel]){
        self.objects = objects
        
    }
    
}
