//
//  BeerCollectionViewCell.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/3/22.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {
    static var identifier = "beer_cell"
    
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var srpLabel: UILabel!
    public func bind(_ beer: Beer) {
        titleLabel.text = beer.name
        srpLabel.text = beer.srp
    }
}
