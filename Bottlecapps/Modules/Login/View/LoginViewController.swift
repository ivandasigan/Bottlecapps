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
        updateUI()
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
        usernameTextField.setStyleAndColor()
        passwordTextField.setStyleAndColor()
  
        usernameTextField.addUnderline()
        passwordTextField.addUnderline()
    }
    
    func updateUI() {
        userViewModel.bindVMToVC = {
            print(self.userViewModel.userData)
        }
    }
    
    //MARK: - OBJC ACTION BUTTON
    @objc func loginAction() {
        appLoader.startLoader()
        if let usernameText = usernameTextField.text, let passwordText = passwordTextField.text {
            let user = User(status: 0, payload: Payload(username: usernameText, password: passwordText), token: "", message: "")
            userViewModel.loginUser(user: user) { [weak self] done in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    if done {
                        self.appLoader.stopLoader()
                    } else {
                        
                    }
                }
            }
            
        }
  
    }
    @objc func createAccountAction() {
        let viewController = Modules.Register.initialViewController
        present(viewController, animated: true, completion: nil)
    }
}
