//
//  BaseRouter.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation
import UIKit

class BaseRouter: BaseRouterProtocol {
    weak var viewController: UIViewController?
    
    var navController: UINavigationController {
        guard let navController = viewController?.navigationController else {
            return UINavigationController()
        }
        
        return navController
    }
    
    func goBack() {
        navController.popViewController(animated: true)
    }
    
    func finish() {
        navController.popToRootViewController(animated: true)
    }
}
