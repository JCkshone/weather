import UIKit
import PromiseKit

class HomePresenter: HomePresenterProtocol {

    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol?
    var dataIsLoadComplete: (() -> ())?
    var data = [WeatherCountryView]()
    var textForSearch: String = "col" {
        didSet {
            loadData()
        }
    }
    
    func viewDidLoad() {
        setupEvents()
        loadData()
    }
}

extension HomePresenter {
    func setupEvents() {
        interactor.weatherDataError = { [weak self] error in
            guard let self = self else { return }
            self.view?.hideLoader()
            self.view?.showAlert("Error", error.localizedDescription, handledSuccess: nil, handledError: nil)
        }
        
        interactor.weatherDataResponse = { [weak self] response in
            guard let self = self else { return }
            self.data = response
            self.view?.hideLoader()
            self.dataIsLoadComplete?()
        }
    }
    func loadData() {
        view?.showLoader()
        interactor.loadWeatherData(whit: textForSearch)
    }
    
    func getItem(index: IndexPath) -> WeatherCountryView {
        data[index.row]
    }
    
    func getNumberItems() -> Int {
        data.count
    }
    func selectItem(index: IndexPath) {
        router?.showDetail(of: data[index.row])
    }
}
