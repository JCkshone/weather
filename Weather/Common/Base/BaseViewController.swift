//
//  BaseViewController.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    var loader: Loader?

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        if let window = UIApplication.shared.windows.first {
            loader = Loader(window: window)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
}

extension BaseViewController: BaseViewProtocol {
    func showLoader() {
        loader?.show()
    }
    
    func hideLoader() {
        loader?.hide()
    }
    
    func showAlert(_ title: String, _ messages: String,
                   handledSuccess: (() -> Void)? = nil,
                   handledError: (() -> Void)? = nil ) {
        
        let alert = UIAlertController(title: title, message: messages, preferredStyle: .alert)
        let successAction = UIAlertAction(title: "Ok", style: .default) { _ in
            handledSuccess?()
        }
        alert.addAction(successAction)
        
        if handledError != nil {
            let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive) { _ in
                handledError?()
            }
            alert.addAction(cancelAction)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
