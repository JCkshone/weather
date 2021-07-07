//
//  WeatherCountryModel.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation

struct WeatherCountryView {
    let title: String
    let type: String
    let actuallyTemp: Int
    let parent: CountryWeather
    let weekTime: [WeatherTime]
    let locationType: String
}
