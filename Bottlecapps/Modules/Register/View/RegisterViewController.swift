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
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView! {
        didSet {
            logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
            logoImageView.clipsToBounds = true
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
