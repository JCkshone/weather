import UIKit
import PromiseKit

class HomeInteractor: HomeInteractorProtocol {

    private let networkServices = NetworkServices()
    
    var weatherDataResponse: (([WeatherCountryView]) -> ())?
    var weatherDataError: ((Error) -> ())?
    
    var presenter: HomePresenterProtocol?
    var data = [WeatherCountryView]()
    var countryData = [CountryWeather]()
    var requestCounter = 0
    
}

extension HomeInteractor {
    func loadCountryWeatherData(whit text: String) -> Promise<[CountryWeather]> {
        HomeRepository().loadWeatherData(from: text)
    }
    
    func loadWeatherData(whit text: String) {
        requestCounter = 0
        countryData.removeAll()
        data.removeAll()
        
        firstly {
            loadCountryWeatherData(whit: text)
        }.done { data in
            if data.isEmpty {
                self.weatherDataResponse?(self.data)
                return
            }
            self.loadWeatherAditionalData(from: data)
        }.catch { error in
            self.weatherDataError?(error)
        }
    }
    
    func loadWeatherAditionalData(from countryData: [CountryWeather]) {
        self.countryData = countryData
        
        firstly {
            HomeRepository().loadCountryWeather(woeid: "\(self.countryData[requestCounter].woeid)")
        }.done { response in
            self.buildDataView(from: response)
        }.catch { error in
            self.weatherDataError?(error)
        }
    }
    
    func buildDataView(from model: CountryWeatherTimeResponse) {
        data.append(WeatherCountryView(title: model.title,
                                       type: model.weekTime.first?.weatherTime ?? "",
                                       actuallyTemp: Int(model.weekTime.first?.maxTemp ?? 0),
                                       weekTime: model.weekTime))
        requestCounter += 1
        
        if countryData.count == self.data.count {
            self.weatherDataResponse?(self.data)
            return
        }
        
        loadWeatherAditionalData(from: self.countryData)
    }
}
