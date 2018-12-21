//
//  LoginViewController.swift
//  TabExample
//
//  Created by Daniel Sanchez on 12/20/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func login(_ sender: Any) {
        guard self.validateFields() else {
            AlertUtilities.presentDefaultAlert(to: self, title: "Empty fields", content: "Please complete all the fields to continue.")
            return
        }
        
        AuthenticationService.authenticate(self.tfUsername.text!, self.tfPassword.text!) { (response) in
            guard let resp = response else {
                AlertUtilities.presentDefaultAlert(to: self, title: "Attention", content: "Credentials are not valid.")
                return
                
            }
            
            if resp.success {
                UserDefaults.standard.set(resp.name, forKey: "name")
                self.performSegue(withIdentifier: "toMain", sender: nil)
            }            
        }
        
    }
    
    private func validateFields() -> Bool {
        return
            self.tfUsername.text != nil && !self.tfUsername.text!.isEmpty && self.tfUsername.text != ""  &&
            self.tfPassword.text != nil && !self.tfPassword.text!.isEmpty && self.tfPassword.text != ""
    }
}


extension LoginViewController: UITextFieldDelegate {
    
}
