import UIKit

class CountryDetailPresenter: CountryDetailPresenterProtocol {
    weak var view: CountryDetailViewProtocol?
    var interactor: CountryDetailInteractorProtocol?
    var router: CountryDetailRouterProtocol?
    var model: WeatherCountryView?

    init(model: WeatherCountryView) {
        self.model = model
    }
}
