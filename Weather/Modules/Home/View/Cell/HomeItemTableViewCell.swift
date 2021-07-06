//
//  HomeItemTableViewCell.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 3/07/21.
//

import UIKit

class HomeItemTableViewCell: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var temperatureImg: UIImageView!
    
    var modelView: WeatherCountryView? {
        didSet {
            guard let modelView = modelView else { return }
            setupView(from: modelView)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        temperatureLabel.text = ""
        countryLabel.text = ""
        temperatureImg.image = UIImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(from model: WeatherCountryView) {
        temperatureLabel.text = "\(model.actuallyTemp)°"
        countryLabel.text = model.title
        temperatureImg.image = UIImage(named: model.type)
    }
}
