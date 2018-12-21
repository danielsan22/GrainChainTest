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
        
        contacts.append(Contact(name: "Daniel", lastName: "Sánchez",age: 23, phoneNumber: "3351413316", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        contacts.append(Contact(name: "Jessica", lastName: "Arvizu",age: 22, phoneNumber: "5514758910", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        contacts.append(Contact(name: "Rocío", lastName: "Ramírez",age: 25, phoneNumber: "9615114120", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        contacts.append(Contact(name: "Edgar", lastName: "Saucedo",age: 55, phoneNumber: "7541225560", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        contacts.append(Contact(name: "Leopoldo", lastName: "Gonzalez",age: 15, phoneNumber: "44856633", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        contacts.append(Contact(name: "Ana", lastName: "Torres",age: 25, phoneNumber: "330319852", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        contacts.append(Contact(name: "Andrea", lastName: "Davila",age: 40, phoneNumber: "78584525", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        contacts.append(Contact(name: "Alejandro", lastName: "Niebla",age: 20, phoneNumber: "45214355", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        contacts.append(Contact(name: "Jesús", lastName: "Fuentes",age: 29, phoneNumber: "66981255", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        contacts.append(Contact(name: "Arturo", lastName: "Placencia",age: 59, phoneNumber: "10101010", profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg"))
        
        ContactStore.shared.contacts = contacts
        success(contacts)
        //        let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * 3 )) / Double(NSEC_PER_SEC)
        //        DispatchQueue.main.asyncAfter(deadline: popTime) {
        //
        //        }
    }
}
