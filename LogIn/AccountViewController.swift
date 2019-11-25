//
//  AccountViewController.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/11/10.
//  Copyright © 2019 hubot. All rights reserved.
//

import UIKit

class AccountViewController: UITableViewController {
    
    var email: String = ""
    
    private var items = [
        AccountItem(name: "User Name", value: "Faker"),
        AccountItem(name: "Password", value: "******"),
        AccountItem(name: "Wechat", value: "Not Linked")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        items.insert(AccountItem(name: "Email", value: email), at: 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.value
        
        return cell
    }
}
