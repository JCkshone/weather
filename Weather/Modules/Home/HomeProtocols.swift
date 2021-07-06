import Foundation
import PromiseKit

protocol HomeRouterProtocol: BaseRouterProtocol {
    func showDetail(of model: WeatherCountryView)
}

protocol HomePresenterProtocol: BasePresenterProtocol {
    var dataIsLoadComplete: (() ->())? { get set }
    var textForSearch: String { get set }
    
    func getItem(index: IndexPath) -> WeatherCountryView
    func getNumberItems() -> Int
    func selectItem(index: IndexPath)
}


protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol?  { get set }
    var weatherDataResponse: (([WeatherCountryView]) -> ())? { get set }
    var weatherDataError: ((Error) -> ())? { get set }
    
    func loadWeatherData(whit text: String)
}


protocol HomeViewProtocol: BaseViewProtocol {
    
    var presenter: HomePresenterProtocol?  { get set }
}
