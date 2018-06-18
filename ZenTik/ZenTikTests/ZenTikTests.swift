//
//  ZenTikTests.swift
//  ZenTikTests
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import XCTest
@testable import ZenTik

class ZenTikTests: XCTestCase {
    
    let config = URLSessionConfiguration.default
    var urlComponents: URLComponents!
    var sessionUnderTest : URLSession!
    
    override func setUp() {
        super.setUp()
        
        urlComponents = URLComponents()
        sessionUnderTest = URLSession(configuration: config)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        urlComponents = nil
        sessionUnderTest = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        urlComponents.scheme = "https"
        urlComponents.host = "rest.coinapi.io"
        urlComponents.path = "/v1/assets"
        let userIdItem = URLQueryItem(name: "apikey", value: "71B66932-911E-42E3-BC37-862D30F51883")
        urlComponents.queryItems = [userIdItem]
        guard let url = urlComponents.url
            else {
                fatalError("Could not create URL from components")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        
        let promise = expectation(description: "Status code: 200")
        var responseError : Error?
        var statusCode : Int?
        
        let dataTask = sessionUnderTest.dataTask(with: url) { data, response, error in
          
            responseError = error
            statusCode = (response as? HTTPURLResponse)?.statusCode
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
