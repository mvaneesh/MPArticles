//
//  MPArticlesTests.swift
//  MPArticlesTests
//
//  Created by test on 04/04/18.
//  Copyright © 2018 personal. All rights reserved.
//

import XCTest
@testable import MPArticles

class MPArticlesViewModelTests: XCTestCase {
    
    var viewModel: MPArticleViewModel? = nil
    
    override func setUp() {
        super.setUp()
        
        viewModel = MPArticleViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        viewModel = nil
    }
    
    func testMostPopularArticles(){
        
        let expectation = XCTestExpectation(description: "Get MP Article data")
        viewModel?.mostPopularArticles(completion: { (success) in
            
            XCTAssertTrue(success != nil)
            XCTAssertTrue(success! == true)
            expectation.fulfill()
            
        }, fail: { (error) in
            
            XCTAssert(false)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testNumberOfRows(){
        var articles: [MPArticleModel] = []
        var article = MPArticleModel()
        article.title = "Test"
        articles.append(article)
        
        viewModel?.popularArticles = articles
        
        let count = viewModel?.numberofRows()
        XCTAssertTrue(count == 1)
    }
    
    func testArticleInfoAt(){
        var articles: [MPArticleModel] = []
        var article = MPArticleModel()
        article.title = "Test"
        articles.append(article)
        
        viewModel?.popularArticles = articles
        
        let info = viewModel?.articleInfoAt(index: 0)
        XCTAssertTrue(info != nil)
        XCTAssertTrue(info!.title == "Test")
    }
    
    func testURLForSelected(){
       
        var articles: [MPArticleModel] = []
        var article = MPArticleModel()
        article.detailURL = "www.google.com"
        articles.append(article)
        
        viewModel?.popularArticles = articles
        
        let info = viewModel?.articleInfoAt(index: 0)
        XCTAssertTrue(info != nil)
        XCTAssertTrue(info!.detailURL == "www.google.com")
    }
    
}
