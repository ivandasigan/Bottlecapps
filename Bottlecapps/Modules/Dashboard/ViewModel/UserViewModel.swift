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
    
    func registerNewUser(user: User) {
        userNetworkManager.request(user: user) { result in
            switch result {
            case .success(let user):
                self.userData = user
            case .failure(let error):
                print("ERROR VM \(error.localizedDescription)")
            }
        }
    }
    
}
