//
//  EndPointType.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 12/30/21.
//

import Foundation


protocol EndPointType {
    var baseUrl: URL { get }
    var path: String { get }
    var task: HTTPTask { get } // request url/json parameters encoders
    var method: HTTPMethod { get } // Method request<GET, POST, PUT etc>
    var header: HTTPHeaders { get }
}
