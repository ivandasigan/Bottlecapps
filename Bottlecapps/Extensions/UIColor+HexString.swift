//
//  UIColor+HexString.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/2/22.
//

import Foundation
import UIKit


extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
    
    func colorWithHexString (hex:String) -> UIColor {
        
        var cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        //var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        var rgbValue : UInt64 = 0
        Scanner(string: rString).scanHexInt64(&rgbValue)
        Scanner(string: gString).scanHexInt64(&rgbValue)
        Scanner(string: bString).scanHexInt64(&rgbValue)
        
        
        return UIColor(red: CGFloat(rgbValue) / 255.0, green: CGFloat(rgbValue) / 255.0, blue: CGFloat(rgbValue) / 255.0, alpha: CGFloat(1))
    }
}
