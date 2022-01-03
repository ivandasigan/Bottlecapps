//
//  RegisterViewController.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/1/22.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - IBOUTLETS
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView! {
        didSet {
            logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
            logoImageView.clipsToBounds = true
        }
    }
 
    var userViewModel: UserViewModel!
    var appLoader : AppLoader!
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
        

        registerButton.tintColor = AppColor.landingPageColor
        loginButton.tintColor = .white
        
        registerButton.addTarget(self, action: #selector(self.registerAction), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(self.loginAction), for: .touchUpInside)

        registerButton.backgroundColor = .white
        registerButton.layer.cornerRadius = 4
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
    @objc func registerAction() {
        appLoader.startLoader()
        if let usernameText = usernameTextField.text, let passwordText = passwordTextField.text {
            let newUser = User(status: 0, payload: Payload(username: usernameText, password: passwordText), token: "", message: "")
            userViewModel.registerNewUser(user: newUser) { [weak self] done in
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
    func updateUI() {
        userViewModel.bindVMToVC = {
            print(self.userViewModel.userData)
          
        }
    }
    @objc func loginAction() {
        dismiss(animated: true, completion: nil)
    }

}
