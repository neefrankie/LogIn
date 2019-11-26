//
//  AccountStore.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/11/26.
//  Copyright © 2019 hubot. All rights reserved.
//

import Foundation

class AccountStore {
    let archiveURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("account.archive")
    }()
    
    func save(account: Account) -> Bool {
        do {
            let data = try PropertyListEncoder().encode(account)
            return NSKeyedArchiver.archiveRootObject(data, toFile: archiveURL.path)
        } catch {
            print("saved")
            return false
        }
    }
    
    func load() -> Account? {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? Data else { return nil }
        
        do {
            let account = try PropertyListDecoder().decode(Account.self, from: data)
            
            return account
        } catch {
            return nil
        }
    }
}
