////
////  OHHTTPStubs.swift
////  Dangerfield-IntroToAppDevTests
////
////  Created by eli dangerfield on 8/30/19.
////  Copyright © 2019 Jacob Rakidzich. All rights reserved.
////
//
//import Foundation
//import OHHTTPStubs
//
///// Creates a stubbed response for a network request
/////
///// - Parameters:
/////   - host: "www.example.com" - Must not contain a scheme (https://), a path ("/xyz/") or end with a backslash
/////   - path: "/path/123" - Optional string
/////   - responseBody: ["Key" : "Value"] - Mocks out what json would look like
/////   - statusCode: 200, 404, etc.,
//func stubNextRequestFor(host: String,
//                        withPath path: String = "",
//                        expectResponse responseBody: [String: AnyObject],
//                        headers: [String: String]? = nil,
//                        forStatus statusCode: Int32) {
//    stub(condition: isHost(host) && isPath(path)) { (request) -> OHHTTPStubsResponse in
//        let headers = headers ?? request.allHTTPHeaderFields
//        return OHHTTPStubsResponse (jsonObject: responseBody, statusCode: statusCode, headers: headers)
//    }
//}
//
//func stubErrorRequestFor(host: String, withPath path: String = "") {
//    stub(condition: isHost(host) && isPath(path)) { (_) -> OHHTTPStubsResponse in
//        let notConnectedError = NSError(domain: NSURLErrorDomain, code: URLError.notConnectedToInternet.rawValue)
//        return OHHTTPStubsResponse(error: notConnectedError)
//    }
//}
//
//func expectStubsForAllCallsToHost(_ host: String) {
//    stub(condition: isHost(host)) { req in
//        let url = req.url?.absoluteString ?? "undefined url"
//        let method = req.httpMethod ?? "request"
//        assert(false, "expected a stubbed response for this \(method): `\(url)`")
//        return OHHTTPStubsResponse()
//    }
//}
//
//func removeAllStubs() {
//    OHHTTPStubs.removeAllStubs()
//}
