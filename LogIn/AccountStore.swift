//
//  AccountStore.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/11/26.
//  Copyright © 2019 hubot. All rights reserved.
//

import Foundation

class AccountStore {
    private let archiveURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectory = documentDirectories.first!
        return documentDirectory
            .appendingPathComponent("account")
            .appendingPathExtension("plist")
    }()
    
    private let plistEncoder = PropertyListEncoder()
    private let plistDecoder = PropertyListDecoder()
    
    func saveToFile(account: Account) -> Bool {
        do {
            let data = try plistEncoder.encode(account)
            try data.write(to: archiveURL, options: [.atomic, .noFileProtection])
            return true
        } catch {
            print("saved")
            return false
        }
    }
    
    func loadFromFile() -> Account? {

        if let data = try? Data(contentsOf: archiveURL),
            let decoded = try? plistDecoder.decode(Account.self, from: data) {
            return decoded
        }
        
        return nil
    }
    
    func clear() {
        do {
            try FileManager.default.removeItem(at: archiveURL)
        } catch {
            print("Remove account error")
        }
    }
    
    static let sharedInstance = AccountStore()
}
