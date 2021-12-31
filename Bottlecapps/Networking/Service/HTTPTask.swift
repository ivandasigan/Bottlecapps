//
//  HTTPTask.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 12/30/21.
//

import Foundation


public typealias HTTPHeaders = [String:String]
public typealias Parameter = [String:Any]

enum HTTPTask {
    case requestPlain
    case requestWithParameters(bodyParameter: Parameter?, bodyEncoding: ParameterEncoding , urlParameter: Parameter)
    case requestWithParametersAndHeader(bodyParameter: Parameter, bodyEncoding: ParameterEncoding, urlParameters: Parameter?, additionalHeaders: HTTPHeaders? )
}
