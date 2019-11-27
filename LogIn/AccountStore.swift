//
//  AccountStore.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/11/26.
//  Copyright © 2019 hubot. All rights reserved.
//

import Foundation

/// See https://forums.bignerdranch.com/t/ch-16-nskeyedarchiver-archiverootobject-deprecated/15781/3
class AccountStore {
    let archiveURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("account.archive")
    }()
    
    func save(account: Account) -> Bool {
        do {
            let data = try PropertyListEncoder().encode(account)
            try data.write(to: archiveURL, options: [.atomic])
//            let data = NSKeyedArchiver.archivedData(withRootObject: account, requiringSecureCoding: true)
            return true
        } catch {
            print("saved")
            return false
        }
    }
    
    func load() -> Account? {

        do {
            let data = try Data(contentsOf: archiveURL)
            let account = try PropertyListDecoder().decode(Account.self, from: data)
            
            return account
        } catch {
            return nil
        }
    }
}
