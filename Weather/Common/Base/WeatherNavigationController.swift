//
//  WeatherNavigationController.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation
import UIKit

class WeatherNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension WeatherNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: String(), style: .plain, target: nil, action: nil)
    }
}
