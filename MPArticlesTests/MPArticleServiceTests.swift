//
//  MPArticleServiceTests.swift
//  MPArticlesTests
//
//  Created by test on 05/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import XCTest
@testable import MPArticles

class MPArticleServiceTests: XCTestCase {
    
     var articleService: MPArticleService? = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        articleService = MPArticleService()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        articleService = nil
    }
    
    func testArticleService() {
    
        let expectation = XCTestExpectation(description: "Get MP Article data")
        let endpoint = WebAPIEndpoint(method: .get, path: "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=3167ba2a4694476cb67d5d5189527701", parameters: nil)
        articleService?.request(endpoint, success: { (data) in
            XCTAssertTrue(data != nil)
            expectation.fulfill()
            
        }) { (error) in
            XCTAssertTrue(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30.0)
    }
}
