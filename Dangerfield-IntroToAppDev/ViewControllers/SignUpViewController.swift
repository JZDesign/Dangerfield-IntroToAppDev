//
//  SignUpViewController.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var signUpView = SignUpView()
    let notifictionName = Notification.Name(rawValue: sucessfullLoginKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    deinit {
        //clean up notification observers before you go
        NotificationCenter.default.removeObserver(self)
    }
    

    fileprivate func setupView(){
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sign Up"
        
        signUpView.signUpButton.addTarget(self, action: #selector(handleSignUpClick(sender:)), for: .touchUpInside)
        
        createObservers()
        
        view = signUpView
    }
    
    fileprivate func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(navigateToHome(sender:)), name: notifictionName, object: nil)
    }
    
    @objc
    func navigateToHome(sender: Any){
        let navigationController = UINavigationController(rootViewController: HomeViewController())
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @objc
    func handleSignUpClick(sender: ActionButton){
        guard let emailAddress = signUpView.emailTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let password = signUpView.passwordTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let confirmPassword =
            signUpView.confirmPasswordTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        
        do{
            try FirebaseConnection.signUpUser(email:emailAddress, password: password, confirmPassword: confirmPassword)
        }catch LoginError.incompleteForm{
            CreateAlert.showBasic(self, title: "Incomplete Form", message: "Please fill out both password and email")
            return
        }catch LoginError.invalidEmail{
            CreateAlert.showBasic(self, title: "Invalid Email", message: "Email not valid, please try again")
            return
        }catch LoginError.incorrectPasswordLength{
            CreateAlert.showBasic(self, title: "Password too short", message: "Passwords are at least 6 characters")
            return
        }catch LoginError.missMatchPasswords{
            CreateAlert.showBasic(self, title: "Password don't match", message: "Please check that both passwords are the same")
            return
        }catch {
            CreateAlert.showBasic(self, title: "Error", message: "An unknown error occured")
            return
        }

    }

}
