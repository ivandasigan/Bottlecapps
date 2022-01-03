//
//  LoginViewController.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/1/22.
//

import UIKit

class LoginViewController: UIViewController {

    
    //MARK: - IBOUTLETS
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView! {
        didSet {
            logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
            logoImageView.clipsToBounds = true
        }
    }
 
    
    
    //MARK: - INITIALIZATIONS
    var appLoader: AppLoader!
    var userViewModel : UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userViewModel = UserViewModel()
        
        appLoader = AppLoader(superView: self.view)
        self.view.backgroundColor = AppColor.landingPageColor
        addButtonActionAndConfigurations()
        configureTextFields()
        
        userViewModel.registerNewUser(user: User(status: 0, payload: Payload(username: "Ivan", password: "pass123"), token: "", message: ""))
        updaetUI()
    }
    
    func updaetUI() {
        userViewModel.bindVMToVC =  {
            print("USER \(self.userViewModel.userData)")
        }
    }
    private func addButtonActionAndConfigurations() {
        

        loginButton.tintColor = AppColor.landingPageColor
        createAccountButton.tintColor = .white
        
        loginButton.addTarget(self, action: #selector(self.loginAction), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(self.createAccountAction), for: .touchUpInside)

        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 4
    }
    
    private func configureTextFields() {
        usernameTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        usernameTextField.textColor = .white
        passwordTextField.textColor = .white
        usernameTextField.addUnderline()
        passwordTextField.addUnderline()
    }
    
    //MARK: - OBJC ACTION BUTTON
    @objc func loginAction() {
        
    }
    @objc func createAccountAction() {
        
    }
}
