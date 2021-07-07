//
//  TimeCollectionViewCell.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 7/07/21.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeImg: UIImageView!
    @IBOutlet weak var timeTemp: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
