//
//  User.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/2/22.
//

import Foundation


struct User: Decodable {
    var status: Int
    var payload: Payload
    var token: String
    var message: String
}

struct Payload: Decodable {
    var username: String
    var password: String
}
