//
//  ForgotPasswordViewController.swift
//  LogIn
//
//  Created by 倪卫国 on 2020/3/9.
//  Copyright © 2020 hubot. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    var email: String = ""
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sendEmailButton: UIButton!
    
    @IBAction func submitEmail(_ sender: UIButton) {
        print("Email: \(String(describing: emailTextField.text))")
        
        performSegue(withIdentifier: "PasswordToken", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.text = email
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let passwordTokenVC = segue.destination as! PasswordTokenViewController
        
        passwordTokenVC.email = self.emailTextField.text ?? ""
    }

}
