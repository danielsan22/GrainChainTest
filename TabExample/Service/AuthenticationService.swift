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
    class func authenticate(_ username: String, _ password: String, _ callback: @escaping (_ result: (success: Bool, name: String)? ) -> Void) {
        
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request("https://kdmldkvxoe.execute-api.us-west-2.amazonaws.com/test", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
//            debugPrint(response)
            switch response.result {
            case .success(let json):
                guard let r = json as? NSDictionary, r.object(forKey: "statusCode") as? Int == 200, let body = r.object(forKey: "body") as? NSDictionary else { callback(nil); return }
                if let name = ((body.object(forKey: "auth") as! NSDictionary).object(forKey: "user") as! NSDictionary).object(forKey: "name") as? String {
                    callback((success: true, name: name))
                }
            case .failure:
                callback(nil)
            }
        }
    }
}
