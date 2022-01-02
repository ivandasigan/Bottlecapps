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
        addButtonActionAndConfiguration()
        configureTextFields()
        
    }
    
    private func addButtonActionAndConfiguration() {
        loginButton.addTarget(self, action: #selector(self.loginAction), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(self.createAccountAction), for: .touchUpInside)
    }
    
    private func configureTextFields() {
        usernameTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        
        // Add Underline to each textfields
        let yAxis = usernameTextField.frame.size.height - 1
        let width = usernameTextField.frame.size.width
        let v = UIView()
        v.backgroundColor = AppColor.underlineColor
        v.frame = CGRect(x: 0, y: yAxis, width: width, height: 0.5)
        self.usernameTextField.addSubview(v)
        self.passwordTextField.addSubview(v)
    }
    
    //MARK: - OBJC ACTION BUTTON
    @objc func loginAction() {
        
    }
    @objc func createAccountAction() {
        
    }
}
