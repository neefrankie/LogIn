//
//  SignUpViewController.swift
//  LogIn
//
//  Created by 倪卫国 on 2020/3/9.
//  Copyright © 2020 hubot. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var email: String = ""

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.text = email
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        print("Email: \(String(describing: emailTextField.text))")
        
        print("Password: \(String(describing: passwordTextField.text))")
        
        print("Confirmation: \(String(describing: confirmPasswordTextField.text))")
    self.navigationController?.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
