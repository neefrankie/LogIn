//
//  ViewController.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/10/13.
//  Copyright © 2019 hubot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        passwordTextField.resignFirstResponder()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return false
        }
        
        if email == "", password == "" {
            return false
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let accountVC = segue.destination as? AccountViewController {
            accountVC.email = emailTextField.text ?? ""
        }
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        let c = Login(email: email, password: password)
        print("Credentials: \(c)")
        
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

