//
//  ForecastTests.swift
//  Dangerfield-IntroToAppDevTests
//
//  Created by eli dangerfield on 8/30/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import XCTest
@testable import Dangerfield_IntroToAppDev

class ForecastTests: XCTestCase {
    
//    func testForecastResponse() {
//
//
//        let expectation = self.expectation(description: #function)
//
//        WeatherMan.forecastForCity("London") { (result) in
//            switch result {
//            case .success(let response) :
//                let weather = Bang.decode(Weather.self, from: response.data)
//                XCTAssertTrue(weather.list?.count ?? 0 > 0)
//            case .failure : XCTFail(#function)
//            }
//            expectation.fulfill()
//
//        }
//        wait(for: [expectation], timeout: 10)
//
//    }
    
    func testJsonPlaceHolder() {
        let expectation = self.expectation(description: #function)
        
        WeatherMan.makeRequest(url: "https://jsonplaceholder.typicode.com", path: "/posts", method: .get) { (result) in
            switch result {
            case .success(let response) :
                let post = Bang.decode([Post].self, from: response.data)
                XCTAssertEqual(post.first?.USERID, 1)
            case .failure : XCTFail(#function)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}

struct Post: Codable {
    let USERID: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case USERID = "userId"
        case id
        case title
        case body
    }
}

struct Posts: Codable {
    let list: [Post]
}

