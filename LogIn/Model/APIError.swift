//
//  APIError.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/11/2.
//  Copyright © 2019 hubot. All rights reserved.
//

import Foundation

struct InvalidReason: Codable {
    var field: String
    var code: String
}

struct APIError: Error, Codable {
    var statusCode: Int = 400
    var message: String
    var error: InvalidReason?
    
    var badRequest: Bool {
        return statusCode == 400
    }
    
    var unauthorized: Bool {
        return statusCode == 401
    }
    
    var forbidden: Bool {
        return statusCode == 403
    }
    
    var notFound: Bool {
        return statusCode == 404
    }
}
