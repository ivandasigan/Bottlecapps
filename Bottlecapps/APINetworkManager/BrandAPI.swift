//
//  BrandAPI.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/1/22.
//

import Foundation



enum BrandAPI {
    case getAllBrands
}

extension BrandAPI: EndPointType {
    var baseUrl: URL {
        return URL(string: "http://127.0.0.1:8000/api/v1")!
    }
    
    var path: String {
        switch self {
        case .getAllBrands:
            return "/brand/"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getAllBrands:
            return .requestPlain
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllBrands:
            return .get
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization" : "token token here"]
    }
    
    
}
