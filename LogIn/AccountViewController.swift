//
//  AccountViewController.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/11/10.
//  Copyright © 2019 hubot. All rights reserved.
//

import UIKit

class AccountViewController: UITableViewController {
    
    private var account: Account?
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var linkStatusLabel: UILabel!
    
    //    private var items = [
//        AccountItem(name: "User Name", value: "Faker"),
//        AccountItem(name: "Password", value: "******"),
//        AccountItem(name: "Wechat", value: "Not Linked")
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let statusBarHeight = UIApplication.shared.statusBarFrame.height
//
//        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
//        tableView.contentInset = insets
//        tableView.scrollIndicatorInsets = insets
        
        self.account = AccountStore.sharedInstance.loadFromFile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let account = account {
            emailLabel.text = account.email
            userNameLabel.text = account.userName ?? "未设置"
            linkStatusLabel.text = account.isLinked ? "已绑定" : "未绑定"
        } else {
            self.dismiss(animated: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
           
            print("Removing account")
            AccountStore.sharedInstance.clear()
            
            // Why this does not work?
//            self.dismiss(animated: true)
            
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
