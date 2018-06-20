//
//  GetAssetsCryptoCompareTest.swift
//  ZenTikTests
//
//  Created by Gabor Racz on 2018/06/20.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import XCTest
@testable import ZenTik

class GetAssetsCryptoCompareTest: XCTestCase {
    
    let config = URLSessionConfiguration.default
    var decoder : JSONDecoder!
    var urlComponents: URLComponents!
    var sessionUnderTest : URLSession!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        decoder = JSONDecoder()
        urlComponents = URLComponents()
        sessionUnderTest = URLSession(configuration: config)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        decoder = nil
        sessionUnderTest = nil
        urlComponents = nil
    }
    
    func testExample() {

        let promise = expectation(description: "Status code: 200")
        
        let url = URL(string:"https://min-api.cryptocompare.com/data/all/coinlist")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = sessionUnderTest.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    if(statusCode == 200){
                        promise.fulfill()
                    }else{
                        XCTFail("FAIL - Status Code: \(statusCode)")
                    }
                }
                
                if let error = responseError {
                    
                    XCTFail("Error: \(error.localizedDescription)")
                    
                } else if let jsonData = responseData {
                    
                    do {
                        let assets = try self.decoder.decode(CryptoParserCryptoCompare.self, from: jsonData)
                        
                        //data is parsed corretly
                        XCTAssertEqual(assets.baseImageURL, "https://www.cryptocompare.com")

                    } catch {
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"])
                    XCTFail("Error: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
