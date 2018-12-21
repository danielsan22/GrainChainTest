//
//  Contact.swift
//  TabExample
//
//  Created by dsanchezpc on 20/12/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import UIKit

class Contact: NSObject {
    
    var id = UUID()
    var name: String
    var lastName: String
    var age: Int
    var phoneNumber: String
    var profileImage: String
    
    init(name: String, lastName: String,  age: Int, phoneNumber: String, profileImage: String) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.phoneNumber = phoneNumber
        self.profileImage = profileImage        
        super.init()
    }
}
