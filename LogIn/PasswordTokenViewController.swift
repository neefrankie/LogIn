//
//  PasswordTokenViewController.swift
//  LogIn
//
//  Created by 倪卫国 on 2020/3/9.
//  Copyright © 2020 hubot. All rights reserved.
//

import UIKit

class PasswordTokenViewController: UIViewController {

    var email: String = ""
    
    @IBOutlet weak var guildeLabel: UILabel!
    
    @IBOutlet weak var tokenTextField: UITextField!
    
    @IBOutlet weak var submitTokenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guildeLabel.text = "FT中文网向您的邮箱\(email)发送的验证码"
    }
    

    @IBAction func submitToken(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ResetPassword", sender: nil)
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
