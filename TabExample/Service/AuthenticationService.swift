//
//  AuthenticationService.swift
//  TabExample
//
//  Created by Daniel Sanchez on 12/20/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import UIKit
import Alamofire

class AuthenticationService: NSObject {
    class func authenticate(_ username: String, _ password: String, _ callback: @escaping (_ result: [String: Any]?) -> Void) {
        
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request("https://kdmldkvxoe.execute-api.us-west-2.amazonaws.com/test", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            debugPrint(response)
            callback(nil)
        }
    }
}
