
//
//  FileBang.swift
//  Dangerfield-IntroToAppDevTests
//
//  Created by eli dangerfield on 8/30/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation

class Bang {
    static func decode<T: Codable>(_ decode: T.Type, from data: Data) -> T {
        //swiftlint:disable force_try
        return try! JSONDecoder().decode(decode.self, from: data)
    }
    
    func loadJsonData(filename: String, in subdir: String? = nil) -> Data {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: filename, ofType: "json", inDirectory: subdir)!
        return NSData(contentsOfFile: path)! as Data
    }
}
