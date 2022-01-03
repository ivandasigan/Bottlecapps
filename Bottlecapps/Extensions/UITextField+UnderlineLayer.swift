//
//  UITextField+UnderlineLayer.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/3/22.
//

import Foundation
import UIKit


extension UITextField {
    
    func setStyleAndColor() {
        self.borderStyle = .none
        self.textColor = .white
        
    
    }
    
    func addUnderline() {
       
        let height = self.frame.size.height
        let width = self.frame.size.width
        let layer = CALayer()
        layer.backgroundColor = AppColor.underlineColor.cgColor
        layer.frame = CGRect(x: 0, y: height - 1, width: width - 38, height: 0.5)
        
        self.layer.addSublayer(layer)
    }
}
