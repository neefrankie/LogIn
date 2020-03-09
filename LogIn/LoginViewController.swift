//
//  ViewController.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/10/13.
//  Copyright © 2019 hubot. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLoginButtonState()
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        passwordTextField.resignFirstResponder()
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        print("Updating save button state")
        updateLoginButtonState()
    }
    
    func updateLoginButtonState() {
        let emailText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        
        loginButton.isEnabled = !emailText.isEmpty && !passwordText.isEmpty
        
        if loginButton.isEnabled {
            loginButton.backgroundColor = loginButton.backgroundColor?.withAlphaComponent(1.0)
        } else {
            loginButton.backgroundColor = loginButton.backgroundColor?.withAlphaComponent(0.5)
        }
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if email.isEmpty {
            return
        }
        
        let c = Login(email: email, password: password)
        print("Credentials: \(c)")
        
        let account = Account(
            id: "e1a1f5c0-0e23-11e8-aa75-977ba2bcc6ae",
            unionId: nil,
            stripeId: nil,
            userName: nil,
            email: email,
            isVerified: false,
            avatarUrl: nil,
            loginMethod: "email",
            wechat: Wechat(nickname: nil, avatarUrl: nil),
            membership: Membership(id: nil, tier: nil, cycle: nil, expireDate: nil, payMethod: nil, autoRenew: nil, status: nil)
        )
        
        let ok = AccountStore.sharedInstance.saveToFile(account: account)
        
        if ok {
            self.dismiss(animated: true)
        }
        
        
//        do {
//            try Fetch()
//                .post(url: "http://192.168.10.195:8000/users/login")
//                .sendJSON(Login(
//                    email: email,
//                    password: password
//                ))
//                .response { (result: Result<APIResponse, NetworkError>) in
//
//                    switch result {
//                    case .success(let apiResp):
//                        print("Status code: \(apiResp.statusCode)")
//                        if let body = apiResp.body {
//                            print ("Response data: \(body)")
//                        }
//
//                    case .failure(let error):
//                        print("error: \(error)")
//                    }
//
//            }
//        } catch {
//            print("Fetch error: \(error).")
//        }
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let email = emailTextField.text ?? ""
        
        switch segue.identifier {
        case "SignUp":
            let signUpVC = segue.destination as! SignUpViewController
            
            signUpVC.email = email
            
        case "ForgotPassword":
            let forgotPasswordVC = segue.destination as! ForgotPasswordViewController
            
            forgotPasswordVC.email = email
            
        default:
            break
        }
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//
//        return true
//    }
}

