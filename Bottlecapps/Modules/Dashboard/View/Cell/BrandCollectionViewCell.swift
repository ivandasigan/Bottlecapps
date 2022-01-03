//
//  BrandCollectionViewCell.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/3/22.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "brand_cell"
    @IBOutlet weak var titleLabel: UILabel!
    
    public func bind(_ title: String) {
        self.titleLabel.text = title
    }
    
}
