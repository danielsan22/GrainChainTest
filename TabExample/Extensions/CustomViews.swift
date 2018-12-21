//
//  CustomViews.swift
//  TabExample
//
//  Created by Daniel Sanchez on 12/20/18.
//  Copyright © 2018 dsr. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func elevate(_ elevation: Float) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.24
        self.layer.shadowRadius = CGFloat(2)
    }
    
    func setBackgroundGradient(from: UIColor, to: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [from.cgColor, to.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addGradientLayer(with colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint, locations: [NSNumber] = [0.0, 1.0], frame: CGRect = CGRect.zero) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        gradientLayer.locations = locations
        gradientLayer.frame = frame
        
        gradientLayer.cornerRadius = self.layer.cornerRadius
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
