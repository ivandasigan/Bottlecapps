//
//  Brand.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/1/22.
//

import Foundation


struct Brand : Codable {
    var id: Int
    var name: String
    var beers: [Beer]
}
