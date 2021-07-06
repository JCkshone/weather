import Foundation

protocol CountryDetailRouterProtocol: AnyObject {

}

protocol CountryDetailPresenterProtocol: AnyObject {
    var model: WeatherCountryView? { get set }
}


protocol CountryDetailInteractorProtocol: AnyObject {

  var presenter: CountryDetailPresenterProtocol?  { get set }
}


protocol CountryDetailViewProtocol: AnyObject {

  var presenter: CountryDetailPresenterProtocol?  { get set }
}
