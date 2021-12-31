//
//  JSONParameterEncoder.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 12/31/21.
//

import Foundation


public struct JSONParameterEncoder: ParameterEncoder {
    func encode(urlRequest: inout URLRequest, parameters: Parameter) throws {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw error
        }
        
    }
}
