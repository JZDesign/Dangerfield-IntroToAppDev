//
//  Networker.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation
import Firebase

let resultLoginKey = "LogInKey"
let successKey = "success"
let failKey = "fail"
let sucessfullSignoutKey = "sucessfullSignoutKey"

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
        Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in
            var result = [String:String]()
            
            if let error = error {
                print("failed to sign in user with error: ",error.localizedDescription)
                result["result"] = failKey
                result["error"] = error.localizedDescription
            }else{
                result["result"] = successKey
            }
            let name = Notification.Name(rawValue: resultLoginKey)
            NotificationCenter.default.post(name: name, object: nil,userInfo: result)
        })
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
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            //this code runs when complete, maybe send a notification that the sign in was complete
            var result = [String:String]()
            
            if let error = error {
                print("failed to sign up user with error: ",error.localizedDescription)
                result["result"] = failKey
                result["error"] = error.localizedDescription
            }else{
                result["result"] = successKey
            }
            let name = Notification.Name(rawValue: resultLoginKey)
            NotificationCenter.default.post(name: name, object: nil,userInfo: result)
            })
    }
    
    static func signOutUser() -> Bool{
        do{
            try Auth.auth().signOut()
            return true
        }catch{
            print("Unsucessfull Sign Out")
            return false
        }
        
    }
}
