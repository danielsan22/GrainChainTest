//
//  ContactCollectionViewCell.swift
//  TabExample
//
//  Created by dsanchezpc on 19/12/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import UIKit

class ContactCollectionViewCell: UICollectionViewCell {
    static let identifier = "ContactCell"
    //https://mcmp.com.au/wp-content/uploads/2017/08/profile-placeholder.jpg
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var phoneContainer: UIView!
    @IBOutlet weak var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageView.layer.cornerRadius = self.imageView.layer.bounds.width / 2
        self.imageView.clipsToBounds = true
        self.phoneContainer.layer.cornerRadius = self.phoneContainer.layer.bounds.height / 2
    }
    
    override func prepareForReuse() {
        //remove the reference of the last values.
    }

}
