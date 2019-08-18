//
//  Networker.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation
import Firebase

let sucessfullLoginKey = "sucessfullLogInKey"

enum LoginError: Error {
    case incompleteForm
    case invalidEmail
    case incorrectPasswordLength
    case missMatchPasswords
}

struct FirebaseConnection {
    
     static func signInUser(email: String, password: String) throws{
        if email.isEmpty || password.isEmpty  {
            throw LoginError.incompleteForm
        }
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        if password.count < 6 {
            throw LoginError.incorrectPasswordLength
        }
        
        print("Sucessful Log in!!!")
    }
    
    static func signUpUser(email: String, password: String, confirmPassword: String) throws{
        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty  {
            throw LoginError.incompleteForm
        }
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        if password.count < 6 {
            throw LoginError.incorrectPasswordLength
        }
        if(password != confirmPassword){
            throw LoginError.missMatchPasswords
        }
        print("Sucessful Sign Up!!!")
        Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            //this code runs when complete, maybe send a notification that the sign in was complete
            let name = Notification.Name(rawValue: sucessfullLoginKey)
            NotificationCenter.default.post(name: name, object: nil)
            })
    }
}
