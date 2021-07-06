//
//  UIView.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 6/07/21.
//

import Foundation
import UIKit

extension UIView {

  // OUTPUT 1
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.lightGray.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: 2, height: 1)
    layer.shadowRadius = 15

    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    layer.cornerRadius = 15
  }

  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
    
    func addConstraintsToFit(view: UIView) {
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                                 options: NSLayoutConstraint.FormatOptions(),
                                                                                 metrics: nil,
                                                                                 views: ["view": view])
        addConstraints(verticalConstraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                                   options: NSLayoutConstraint.FormatOptions(),
                                                                                   metrics: nil,
                                                                                   views: ["view": view])
        addConstraints(horizontalConstraints)
    }
}

