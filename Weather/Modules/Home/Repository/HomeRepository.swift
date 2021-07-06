//
//  HomeRepository.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation
import PromiseKit

protocol HomeRepositoryProtocol {
    func loadWeatherData(from text: String) -> Promise<[CountryWeather]>
    func loadCountryWeather(woeid country: String) -> Promise<CountryWeatherTimeResponse>
}

struct HomeRepository: HomeRepositoryProtocol {

    private var networkServices: NetworkServices
    private var configuration: Configuration
    
    init() {
        networkServices = NetworkServices()
        configuration = Configuration()
    }
    
    func loadWeatherData(from text: String) -> Promise<[CountryWeather]> {
        networkServices.queryProperties[WeatherPropertyQuery.query.rawValue] = text
        return Promise { seal in
            firstly {
                networkServices.request(aditionalPath: AditionalPaths.search, of: [CountryWeather].self)
            }.done { data in
                seal.fulfill(data)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    
    func loadCountryWeather(woeid country: String) -> Promise<CountryWeatherTimeResponse> {
        networkServices.otherPath = country
        return Promise { seal in
            firstly {
                networkServices.request(aditionalPath: AditionalPaths.search, of: CountryWeatherTimeResponse.self)
            }.done { data in
                seal.fulfill(data)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
