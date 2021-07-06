//
//  BaseProtocols.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation

//MARK: PRESENTER
protocol BasePresenterProtocol {
    func viewDidLoad()
}

//MARK: VIEW
protocol BaseViewProtocol: AnyObject {
    func showAlert(_ title: String, _ messages: String,
                   handledSuccess: (() -> Void)?,
                   handledError: (() -> Void)?)
    func showLoader()
    func hideLoader()
}

//MARK: Router
protocol BaseRouterProtocol {
    func goBack()
    func finish()
}
