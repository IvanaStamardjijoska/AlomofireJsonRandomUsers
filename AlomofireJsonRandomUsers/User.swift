//
//  User.swift
//  AlomofireJsonRandomUsers
//
//  Created by CodeWell on 12/3/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var firstName: String?
    var lastName: String?
    var email : String?
    var age: Int?
    

        
        init(withData jsonData: [String:Any]) {
            if let namedata = jsonData["name"] as? [String:Any], let firstName = namedata["first"] as? String, let lastName = namedata["last"] as? String{
                self.firstName = firstName
                self.lastName = lastName
            }
            
            if let email = jsonData["email"] as? String{
                self.email = email
            }
            if let ageData = jsonData["dob"] as? [String:Any],let age = ageData["age"] as? Int{
                self.age = age
            }
        }
        
}
