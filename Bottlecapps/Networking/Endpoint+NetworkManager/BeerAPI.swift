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
        return URL(string: "http://127.0.0.1:8000/api/v1")!
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



struct BeerNetworkManager {
    
    var beerRoute = Router<BeerAPI>()
    
    func getAllBeers(completion: @escaping(Result<>)) {
        beerRoute.request(.getAllBeers) { data, response, error in
            do {
                
            }
        }
    }
    
}
