//
//  ContactStore.swift
//  TabExample
//
//  Created by Daniel Sanchez on 12/20/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import UIKit

class ContactStore {
    
    static let shared = ContactStore()
    
    @objc var contacts: Array<Contact> = []
    
    private init(){}
    
}
