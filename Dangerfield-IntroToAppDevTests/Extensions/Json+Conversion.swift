//
//  Json+Conversion.swift
//  Dangerfield-IntroToAppDevTests
//
//  Created by eli dangerfield on 8/30/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation

extension Data {
    /// Used to read data in Human
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
    
    /// Convert data to JSON to access the data's properties
    func toJSON() -> [String: Any]? {
        guard let json = try? JSONSerialization.jsonObject(
            with: self,
            options: .allowFragments) as? [String: AnyObject] else {
                return nil
        }
        return json
    }
}
