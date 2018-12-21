//
//  NewContactViewController.swift
//  TabExample
//
//  Created by Daniel Sanchez on 12/20/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = UserDefaults.standard.string(forKey: "name") ?? ""
        self.navigationItem.title = name
                
        self.setupViews()
    }
    
    @IBAction func createContact(_ sender: Any) {
        guard self.validateFields() else {
            AlertUtilities.presentDefaultAlert(to: self, title: "Empty fields", content: "Please complete all the fields to continue.")
            return
        }
        
        let newContact = Contact(name: self.tfName.text!, lastName: self.tfLastName.text!, age: Int(self.tfAge.text!)!, phoneNumber: self.tfPhoneNumber.text!, profileImage: "https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg")
        
        ContactStore.shared.contacts.append(newContact)
        AlertUtilities.presentDefaultAlert(to: self, title: "Success!", content: "\(self.tfName.text!) added successfully")
    }
    
    private func validateFields() -> Bool {
        return
            self.tfName.text != nil && !self.tfName.text!.isEmpty && self.tfName.text != ""  &&
            self.tfLastName.text != nil && !self.tfLastName.text!.isEmpty && self.tfLastName.text != ""  &&
            self.tfPhoneNumber.text != nil && !self.tfPhoneNumber.text!.isEmpty && self.tfPhoneNumber.text != ""  &&
            self.tfAge.text != nil && !self.tfAge.text!.isEmpty && self.tfAge.text != ""
    }
    
    private func setupViews() {
        self.imageView.layer.cornerRadius = self.imageView.layer.frame.width / 2
    }
}

extension NewContactViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == self.tfAge {
            let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
        }
        
        return true
    }
}
