//
//  LoginVC.swift
//  Breakpoint
//
//  Created by eslam dweeb on 3/28/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var passwordField: InsetTextField!
    @IBOutlet weak var emailField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }

    @IBAction func signINBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, userLoginComplete: { (success, loginError) in
                if success{
                    self.dismiss(animated: true, completion: nil)
                }else{
                print(String(describing:loginError?.localizedDescription))
                }
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userRegisterComplete: { (success, registerationError) in
                    if success{
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userLoginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                           print("successfully registered user")
                        })
                        
                    }else{
                        print(String(describing:registerationError?.localizedDescription))
                    }
                })
            })
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate{ }
