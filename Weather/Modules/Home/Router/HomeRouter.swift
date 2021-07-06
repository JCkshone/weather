import UIKit

class HomeRouter: BaseRouter, HomeRouterProtocol {
    func showDetail(of model: WeatherCountryView) {
        let vc = CountryDetailModule.build(model: model)
        vc.title = model.title
        navController.pushViewController(vc, animated: true)
    }
}
