//
//  Service.swift
//  CRM Manager
//
//  Created by ROHAN BHASIN on 08/07/20.
//  Copyright © 2020 ROHAN BHASIN. All rights reserved.
//

import UIKit

class Service: NSObject {
    
    static let Shareinstance = Service()
    
    func getLoginData(completion:@escaping([LoginModel]?, Error?) ->()){
        let urlString  = "https://www.postman.com/collections/74566f5953baa46a3af6"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url){(data,response,error) in
            if let err = error{
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
                
            }else {
                
                guard let data = data else { return }
                do {
                    var loginData =  [LoginModel]()
                    let results = try JSONDecoder().decode(objectModel.self, from: data)
                    print(results)
                    for object in results.objects{
                        loginData.append(LoginModel(key: object.key!, value: object.value!, type: object.type!))
                    }
                    completion(loginData, nil)
                }catch let jsonErr{
                    print("JSON error: \(jsonErr.localizedDescription)")
                }
            }
        }.resume()
    }

}
