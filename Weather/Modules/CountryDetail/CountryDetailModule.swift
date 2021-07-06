import UIKit

class CountryDetailModule {

    static func build(model: WeatherCountryView) -> UIViewController {        
        let view = CountryDetailView()
        let interactor = CountryDetailInteractor()
        let router = CountryDetailRouter()
        let presenter = CountryDetailPresenter(model: model)

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
