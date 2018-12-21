//
//  AlertUtilities.swift
//  TabExample
//
//  Created by Daniel Sanchez on 12/20/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import UIKit

class AlertUtilities: NSObject {
    class func presentTwoActionAlert(to vc: UIViewController, title: String, content: String, leftBtnText: String, rightBtnText: String, leftCallback: @escaping () -> Void, rightCallback: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: content, preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: rightBtnText, style: UIAlertAction.Style.default, handler: { action in
            rightCallback()
        }))
        alert.addAction(UIAlertAction(title: leftBtnText, style: UIAlertAction.Style.cancel, handler: { action in
            leftCallback()
        }))
        
        // show the alert
        vc.present(alert, animated: true, completion: nil)
    }
    class func presentDefaultAlert(to vc: UIViewController, title: String, content: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: content, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        vc.present(alert, animated: true, completion: nil)
    }
}
