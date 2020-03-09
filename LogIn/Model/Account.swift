//
//  Account.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/11/12.
//  Copyright © 2019 hubot. All rights reserved.
//

import Foundation

struct Wechat : Codable {
    let nickname: String?
    let avatarUrl: String?
}

struct Membership : Codable {
    let id: String?
    let tier: String?
    let cycle: String?
    let expireDate: String?
    let payMethod: String?
    let autoRenew: Bool?
    let status: String?
    let vip: Bool = false
}

struct Account : Codable {
    let id: String
    let unionId: String?
    let stripeId: String?
    let userName: String?
    let email: String
    let isVerified: Bool
    let avatarUrl: String?
    let loginMethod: String
    let wechat: Wechat
    let membership: Membership
    
    var displayName: String {
        get {
            if let name = userName, !name.isEmpty {
                
                return name
            }
            
            if let name = wechat.nickname, !name.isEmpty {
                
                return name
            }
            
            return String(email.split(separator: "@")[0])
        }
    }
    
    var isLinked: Bool {
        get {
            return !id.isEmpty && unionId != nil
        }
    }
}
