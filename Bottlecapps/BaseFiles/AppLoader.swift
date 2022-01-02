//
//  AppLoader.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/2/22.
//

import Foundation
import UIKit


struct AppLoader {
    
    var superView: UIView
    var activityIndicator : UIActivityIndicatorView
    init(superView: UIView) {
        self.superView = superView
        self.activityIndicator = UIActivityIndicatorView()
        self.activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        ])
    }
    
    func startLoader() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    func stopLoader() {
        activityIndicator.stopAnimating()
    }
}
