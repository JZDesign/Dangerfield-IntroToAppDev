//
//  WeatherMan.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/30/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation
typealias Response = (reponse: URLResponse, data: Data)
typealias URLCompletion = (Result<Response, Error>) -> Void


enum HTTPMethod: String {
    case post
    case get
    case patch
    case delete
    
    func forUse() -> String {
        return self.rawValue.capitalized
    }
}
struct WeatherMan {
    
    //api.openweathermap.org/data/2.5/forecast?q={city name},{country code}
    static let baseURL = "https://api.openweathermap.org"
    static let version = "/data/2.5"
    static let path = "/forecast"
    private static var session = URLSession.shared
    private static let credentials = "&appid=53ca8d761c4ae2797b9f72837c3c6e9d"
    
    static func makeRequest(url: String,
                            path: String,
                            method: HTTPMethod,
                            completion: @escaping URLCompletion) {
        
        var request = URLRequest(url: URL(string: url + path)!)
        request.httpMethod = method.forUse()
        
        session.dataTask(with: request){ (data, urlResponse, error) in
            if let urlResponse = urlResponse {
                completion(.success((urlResponse, data ?? "".data(using: .utf8)!)))
            } else {
                completion(.failure(error!))
            }
        }.resume()
    }
    
    private static func cityQuery(_ city: String) -> String {
        return "?q=\(city)"
    }
    
    static func forecastForCity(_ city: String, completion: @escaping URLCompletion ) {
        let finalPath = version + path + cityQuery(city) + credentials
        makeRequest(url: baseURL, path: finalPath, method: .get, completion: completion)
    }
}
