//
//  Dangerfield_IntroToAppDevTests.swift
//  Dangerfield-IntroToAppDevTests
//
//  Created by Jacob Rakidzich on 8/17/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import XCTest
@testable import Dangerfield_IntroToAppDev
// MARK: - LESSON
typealias result = Result<Bool, Error>  // Success, Failure in Swift  (lhs rhs) in other lang == Either Pattern

class DangerfieldIntroToAppDevTests: XCTestCase {

    func testEitherSuccess() {
        handleEither(succeeds: true) { (result) in
            switch result {
            case .success(let val):
                XCTAssertTrue(val)
            default: XCTFail(#function)
            }
        }
    }
    
    func testCompletionBlockSucceeds() {
        completionBlock(succeeds: true) { (value, error) in
            XCTAssertNil(error)
            XCTAssertTrue(value ?? false)
        }
    }
    
    func handleEither(succeeds: Bool, completion: @escaping (result)-> Void) {
        succeeds ? completion(.success(true)) : completion(.failure(TestError.error))
    }
    
    func completionBlock(succeeds: Bool, completion: @escaping (Bool?, Error?)-> Void) {
        succeeds ? completion(true, nil) : completion(nil, TestError.error)
    }
    

}

enum TestError : Error {
    case error
}
