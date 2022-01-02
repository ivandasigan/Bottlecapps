//
//  UserAPI.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/2/22.
//

import Foundation



enum UserAPI {
    case login(user: User)
    case register(user: User)
}

extension UserAPI : EndPointType {
    var baseUrl: URL {
        return URL(string: "http://127.0.0.1:8000/api/v1")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login/"
        case .register:
            return "/register/"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login(let user), .register(let user):
            return .requestWithParameters(bodyParameter: ["username":user.username, "password":user.password], bodyEncoding: .jsonEncoding, urlParameter: [:])
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .register:
            return .post
        }
    }
    
    var header: HTTPHeaders {
        return [:]
    }
}

struct UserNetworkManager {
    
    var userRouter : Router<UserAPI>

    init() {
        self.userRouter = Router<UserAPI>()
    }
    
    func request(user: User, completion: @escaping(Result<User, Error>) -> ()) {
        userRouter.request(.register(user: user)) { data, response, error in
            do {
                guard let mdata = data else { return }
                let decodedUser = try JSONDecoder().decode(User.self, from: mdata)
                completion(.success(decodedUser))
                
            } catch let error as NSError {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
    }
}
