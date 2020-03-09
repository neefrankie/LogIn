//
//  MyFTViewController.swift
//  LogIn
//
//  Created by 倪卫国 on 2020/3/5.
//  Copyright © 2020 hubot. All rights reserved.
//

import UIKit

class MyFTViewController: UITableViewController {

    
    @IBOutlet weak var accountLabel: UILabel!
    
    private var account: Account? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        // Do any additional setup after loading the view.
        
        
    }
    
    // Check login status here
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
        
        account = AccountStore.sharedInstance.loadFromFile()
        
        if let account = account {
            accountLabel.text = account.displayName
        } else {
            accountLabel.text = "登录/注册"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Select table cell at section \(indexPath.section), row \(indexPath.row)")
        
        // The first row has two segues:
        // Go to the login view controller if not logged in yet;
        // or go to the account view controller.
        // The two segues a linked to this view controller rather thatn
        // to any particular row item.
        if indexPath.section == 0 && indexPath.row == 0 {
            
            if account == nil {
                performSegue(withIdentifier: "Login", sender: nil)
            } else {
                performSegue(withIdentifier: "AccountDetail", sender: nil)
            }
        }
    }
    
    @IBAction func unwindToMyFT(unwindSegue: UIStoryboardSegue) {
        
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
