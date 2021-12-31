//
//  URLParameterEncoding.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 12/31/21.
//

import Foundation



public struct URLParameterEncoder: ParameterEncoder {
    func encode(urlRequest: inout URLRequest, parameters: Parameter) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingURL } // checks when url is nil
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            for (key,value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
    
}
