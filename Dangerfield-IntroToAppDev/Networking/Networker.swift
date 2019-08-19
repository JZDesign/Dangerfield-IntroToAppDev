//
//  Networker.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation
import Firebase

enum LoginError: Error {
    case incompleteForm
    case invalidEmail
    case incorrectPasswordLength
    case missMatchPasswords
}

struct FirebaseConnection {

     static func signInUser(email: String, password: String, completion: @escaping AuthDataResultCallback) throws {
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        if password.count < 6 {
            throw LoginError.incorrectPasswordLength
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }

    static func signUpUser(email: String, password: String, confirmPassword: String, completion: @escaping AuthDataResultCallback) throws {
        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            throw LoginError.incompleteForm
        }
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        if password.count < 6 {
            throw LoginError.incorrectPasswordLength
        }
        if(password != confirmPassword) {
            throw LoginError.missMatchPasswords
        }
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }

    static func signOutUser() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        }catch {
            print("Unsucessfull Sign Out")
            return false
        }
    }
}
