//
//  ContactsViewController.swift
//  TabExample
//
//  Created by dsanchezpc on 19/12/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBarConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var isFiltering: Bool = false
    private var isEditingElements: Bool = false
    
    var editBtnItem: UIBarButtonItem!
    var filterBtnItem: UIBarButtonItem!
    var observation: NSKeyValueObservation?
    
//    var contactsStore: Array<Contact> = [] {
//        didSet {
//            contacts = contactsStore
//        }
//    }
    
    var contacts: Array<Contact> = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.allowsMultipleSelection = false
        
        let cell = UINib(nibName: "ContactCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: ContactCollectionViewCell.identifier)
        
        ContactService.fetchContacts { (contacts) in
            self.contacts = contacts
            
        }
        self.filterBtnItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(actionFilter(sender:)))
        self.editBtnItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(actionEdit(sender:)))
        self.navigationItem.leftBarButtonItem = self.filterBtnItem
        self.navigationItem.rightBarButtonItem = self.editBtnItem
        
        self.searchBar.delegate = self
        
        let name = UserDefaults.standard.string(forKey: "name") ?? ""
        self.navigationItem.title = name
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.contacts = ContactStore.shared.contacts
    }
    
    // MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCollectionViewCell.identifier, for: indexPath) as! ContactCollectionViewCell
        let contact = self.contacts[indexPath.row]
        cell.name.text = contact.name
        cell.phone.text = contact.phoneNumber
        cell.age.text = "\(contact.age)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isEditingElements {
            let elementToDelete = self.contacts[indexPath.row]
            AlertUtilities.presentTwoActionAlert(to: self, title: "Delete", content: "Are you sure you want to delete this contact?", leftBtnText: "Yes", rightBtnText: "No",leftCallback: {
                ContactStore.shared.contacts.removeAll(where: {$0.id == elementToDelete.id })
                self.contacts = ContactStore.shared.contacts
            }, rightCallback: {
                
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 10, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }
    
    //Action on Edit button
    @objc func actionFilter(sender: UIBarButtonItem) {
        self.isFiltering = !self.isFiltering
        if !isFiltering {
            self.view.endEditing(true)
        } else {
            self.searchBar.becomeFirstResponder()
        }
        UIView.animate(withDuration: 0.4) {
            self.searchBarConstraint.constant = self.isFiltering ? 56 : 0.0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func actionEdit(sender: UIBarButtonItem) {
        self.isEditingElements = !self.isEditingElements
        self.editBtnItem.title = self.isEditingElements ? "Done" : "Edit"
    }
}


extension ContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.contacts = ContactStore.shared.contacts.filter({$0.name.starts(with: searchText)})
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
}
