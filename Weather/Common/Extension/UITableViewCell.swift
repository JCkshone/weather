//
//  UITableViewCell.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        String(describing: self)
    }
}

extension UITableView {
    func scrollTop() {
        let topRow = IndexPath(row: 0, section: 0)
        self.scrollToRow(at: topRow, at: .top, animated: true)
    }
}

extension UICollectionViewCell {
    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        String(describing: self)
    }
}


