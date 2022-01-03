//
//  UserViewModel.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/2/22.
//

import Foundation

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
    
    func loginUser(user: User) {
        userNetworkManager.loginRequest(user: user) { result in
            switch result {
            case .success(let user):
                self.userData = user
            case .failure(let error):
                print("VM ERR \(error.localizedDescription)")
            }
        }
    }
    
    func registerNewUser(user: User) {
        userNetworkManager.registerRequest(user: user) { result in
            switch result {
            case .success(let user):
                self.userData = user
            case .failure(let error):
                print("VM ERR \(error.localizedDescription)")
            }
        }
    }
    
}
