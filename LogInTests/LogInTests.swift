//
//  LogInTests.swift
//  LogInTests
//
//  Created by 倪卫国 on 2019/11/27.
//  Copyright © 2019 hubot. All rights reserved.
//

import XCTest

class LogInTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let logIn = Login(email: "neefrankie@gmail.com", password: "12345678")
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(logIn)
            
            print(String(data: data, encoding: .utf8)!)
        } catch {
            print("Encoding error: \(error)")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
