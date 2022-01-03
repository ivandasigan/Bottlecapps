//
//  Modules.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/3/22.
//

import Foundation
import UIKit


public enum Modules: String {
    case Login
    case Register
    case Dashboard
    
    var storyboard: UIStoryboard {
        switch self {
        case .Login, .Register, .Dashboard:
            return UIStoryboard(name: self.rawValue.capitalized, bundle: nil)
        }
    }
    
    var initialViewController: UIViewController {
        switch self {
        case .Login, .Register, .Dashboard:
            return storyboard.instantiateInitialViewController() ?? UIViewController()
        }
    }
}
