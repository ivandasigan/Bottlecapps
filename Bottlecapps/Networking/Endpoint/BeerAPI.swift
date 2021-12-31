//
//  BeerAPI.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 12/31/21.
//

import Foundation


enum BeerAPI {
    case getAllBeers
}

extension BeerAPI: EndPointType {
    var baseUrl: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        case .getAllBeers:
            return "/beers/"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getAllBeers:
            return .requestPlain
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllBeers:
            return .get
        }
    }
    
    var header: HTTPHeaders {
        return ["Content-Type":"application/json"]
    }
}
