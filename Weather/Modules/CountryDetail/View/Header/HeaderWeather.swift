//
//  HeaderWeather.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 6/07/21.
//

import UIKit

class HeaderWeather: XibView {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var temperatureImg: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var parentCountryLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    
    var modelView: WeatherCountryView? {
        didSet {
            guard let modelView = modelView else { return }
            setupView(with: modelView)
        }
    }

}

extension HeaderWeather {
    func setupView(with data: WeatherCountryView) {
        temperatureLabel.text = "\(data.actuallyTemp)°"
        countryLabel.text = data.title
        temperatureImg.image = UIImage(named: data.type)
        stateLabel.text = data.locationType
        parentCountryLabel.text = data.parent.title
        humidityLabel.text = "\(data.weekTime.first?.humidity ?? 0)%"
    }
}
