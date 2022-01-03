//
//  UserViewModel.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/2/22.
//

import Foundation

public typealias ResultCompletion = (Bool) -> ()

class UserViewModel: NSObject {
    
    
    private var userNetworkManager: UserNetworkManager!
    var userData: User! {
        didSet {
            self.bindVMToVC()
        }
    }
    var bindVMToVC: (() -> ()) = {}
    
    override init() {
        super.init()
        self.userNetworkManager = UserNetworkManager()
    }
    
    func loginUser(user: User, completion: @escaping ResultCompletion) {
        userNetworkManager.loginRequest(user: user) { result in
            switch result {
            case .success(let user):
                self.userData = user
                completion(true)
            case .failure(let error):
                print("VM ERR \(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
    func registerNewUser(user: User, completion: @escaping ResultCompletion) {
        userNetworkManager.registerRequest(user: user) { result in
            switch result {
            case .success(let user):
                self.userData = user
                completion(true)
            case .failure(let error):
             
                print("VM ERR \(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
}
