//
//  ParameterEncoding.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 12/30/21.
//

import Foundation



public enum NetworkError: String, Error {
    case parametersNil = "Parameters are nil"
    case encodingFailed = "Parameters encoding failed"
    case missingURL = "URL is nil"
}

protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, parameters: Parameter) throws
}

public enum ParameterEncoding {
    
    case urlEncoding
    case jsonEncoding
    case urlAndJsonEncoding
    
    public func encode(urlRequest: inout URLRequest,
                       bodyParameters: Parameter?,
                       urlParameters: Parameter?) throws {
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = urlParameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, parameters: urlParameters)
            case .jsonEncoding:
                guard let bodyParameters = bodyParameters else { return }
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, parameters: bodyParameters)
            case .urlAndJsonEncoding:
                guard let bodyParameters = bodyParameters, let urlParameters = urlParameters else {return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, parameters: urlParameters)
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, parameters: bodyParameters)
            }
        } catch {
            throw error
        }
    }
}



