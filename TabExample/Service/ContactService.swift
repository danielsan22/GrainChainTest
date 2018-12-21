//
//  ContactService.swift
//  TabExample
//
//  Created by dsanchezpc on 20/12/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import UIKit

class ContactService: NSObject {
    
    class func fetchContacts(_ success: @escaping (Array<Contact>) -> Void) {
        var contacts: Array<Contact> = []
        for i in 0...9 {
            contacts.append(Contact(name: "Contact \(i)", lastName: "Last Name X\(i)",age: 20 + i, phoneNumber: "3333333333", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        }
        ContactStore.shared.contacts = contacts
        success(contacts)
//        let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * 3 )) / Double(NSEC_PER_SEC)
//        DispatchQueue.main.asyncAfter(deadline: popTime) {
//
//        }
    }
}
