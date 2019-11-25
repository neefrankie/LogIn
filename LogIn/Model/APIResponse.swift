//
//  APIResponse.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/11/2.
//  Copyright © 2019 hubot. All rights reserved.
//

import Foundation

struct APIResponse {
    var statusCode: Int
    var body: String?
    
    var noContent: Bool {
        return statusCode == 204
    }
}
