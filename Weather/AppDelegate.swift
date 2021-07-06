//
//  AppDelegate.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 3/07/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeModule.build()
        vc.title = "Wather App"
        window?.rootViewController = WeatherNavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        return true
    }
}

