//
//  CountryModel.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation

struct CountryWeather: Codable {
    let title: String
    let locationType: String
    let woeid: Int
    let latAndLong: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case locationType = "location_type"
        case woeid = "woeid"
        case latAndLong = "latt_long"
    }
}

struct CountryWeatherTimeResponse: Codable {
    let weekTime: [WeatherTime]
    let parent: CountryWeather
    let title: String
    let woeid: Int
    
    enum CodingKeys: String, CodingKey {
        case weekTime = "consolidated_weather"
        case parent = "parent"
        case title = "title"
        case woeid = "woeid"
    }
}

struct WeatherTime: Codable {
    let weatherTime: String
    let applicableDate: String
    let minTemp: Double
    let maxTemp: Double
    let theTemp: Double
    let windSpeed: Double
    let windDirection: Double
    let airPressure: Double
    let humidity: Int
    let visibility: Double
    let predictability: Int
    
    enum CodingKeys: String, CodingKey {
        case weatherTime = "weather_state_abbr"
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case windDirection = "wind_direction"
        case airPressure = "air_pressure"
        case humidity = "humidity"
        case visibility = "visibility"
        case predictability = "predictability"
    }
}
