//
//  Loader.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation
import UIKit

class Loader: UIView {
    
    private var progressView: ProgressView!
    var frontWindow: UIWindow?
    
    public init(window: UIWindow) {
        super.init(frame: UIScreen.main.bounds)
        self.frontWindow = window
        customizeUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func customizeUI() {
        backgroundColor = .clear
        backgroundColor = .white
        alpha = 0.9
        progressView  = ProgressView(frame: CGRect(x: (frame.width/2) - 30, y: (frame.height/2) - 30, width: 60, height: 60))
        addSubview(progressView)

    }
    
    public func show() {
        startProgresLoader()
    }
}

extension Loader: CAAnimationDelegate {
    
    func start() {
        startProgresLoader()
    }
    
    public func hide() {
        progressView.stopAnimation()
        isHidden = true
        self.removeFromSuperview()
    }

    func startProgresLoader() {
        isHidden = false
        frontWindow?.endEditing(true)
        frontWindow?.addSubview(self)
        progressView.startAnimation(withColor: UIColor.loaderView.cgColor)
    }
}


