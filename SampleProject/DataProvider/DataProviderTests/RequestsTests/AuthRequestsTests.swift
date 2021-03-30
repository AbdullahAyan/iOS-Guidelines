//
//  AuthTests.swift
//  DataProviderTests
//
//  Created by Mehmet Salih Aslan on 29.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import XCTest

class AuthTests: XCTestCase {
    
    let dataProvider = MockDataProvider()

    func testLoginRequest() throws {
        let expectation = expectation(description: "request expectation")
        let request = LoginRequest(username: "aslanmsalih", password: "password")
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testRegisterRequest() throws {
        let expectation = expectation(description: "request expectation")
        let request = RegisterRequest(username: "aslanmsalih", email: "aslanmsalih@gmail.com", password: "password")
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testLogoutRequest() throws {
        let expectation = expectation(description: "request expectation")
        let request = LogoutRequest()
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

}
