//
//  NYNewsTests.swift
//  NYNewsTests
//
//  Created by Marianne Katramiz on 11/17/20.
//

import XCTest
@testable import NYNews

class NYNewsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testGetNews() {
        NewsApi.shared.getNews(days: 1) { (success, _, _) in
            if success {
                XCTAssert(success, "GetNews Completed successfully")
            } else {
                XCTFail("GetNews failed")
            }
        }
    }
    
    func testGetNewsSeven() {
        NewsApi.shared.getNews(days: 7) { (success, _, _) in
            if success {
                XCTAssert(success, "GetNewsSeven Completed successfully")
            } else {
                XCTFail("GetNewsSeven failed")
            }
        }
    }
    
    func testGetNewsThirty() {
        NewsApi.shared.getNews(days: 30) { (success, _, _) in
            if success {
                XCTAssert(success, "GetNewsThirty Completed successfully")
            } else {
                XCTFail("GetNewsThirty failed")
            }
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
