//
//  Router.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 12/31/21.
//

import Foundation


public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()


protocol NetworkRouter  {
    associatedtype Endpoint: EndPointType
    func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    
    private var task : URLSessionTask?
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.builRequest(route: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
            
        } catch {
            completion(nil, nil, error)
        }
        task?.resume()
        
    }
    func cancel() {
        self.task?.cancel()
    }
    
    
    private func builRequest(route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseUrl.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        request.httpMethod = route.method.rawValue
        do {
            switch route.task {
            case .requestPlain:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestWithParameters(let bodyParameters, let bodyEncoding, let urlParameters):
                try self.configureParameters(bodyParameter: bodyParameters, bodyEncoding: bodyEncoding, urlParameters: urlParameters, urlRequest: &request)
            case .requestWithParametersAndHeader(let bodyParameter, let bodyEncoding, let urlParameters, let additionalHeaders):
                self.additionalHeader(additionalHeaders: additionalHeaders, urlRequest: &request)
                try configureParameters(bodyParameter: bodyParameter, bodyEncoding: bodyEncoding, urlParameters: urlParameters, urlRequest: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    private func configureParameters(bodyParameter: Parameter?,
                                     bodyEncoding: ParameterEncoding,
                                     urlParameters: Parameter?,
                                     urlRequest: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &urlRequest, bodyParameters: bodyParameter, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    private func additionalHeader(additionalHeaders: HTTPHeaders?, urlRequest: inout URLRequest) {
        guard let additionalHeaders = additionalHeaders else {
            return
        }
        for (key, value) in additionalHeaders {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
    }
}
