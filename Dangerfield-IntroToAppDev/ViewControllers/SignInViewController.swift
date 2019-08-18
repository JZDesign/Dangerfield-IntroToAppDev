//
//  SignInViewController.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    var signInView = SignInView()
    let notifictionName = Notification.Name(rawValue: resultLoginKey)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func setupView(){
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sign in"
        signInView.signinButton.addTarget(self, action: #selector(handleSignInClick(sender:)), for: .touchUpInside)
        view = signInView
    }

    
    fileprivate func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleSigninResult(_:)), name: notifictionName, object: nil)
    }
    
    @objc
    func handleSigninResult(_ notification: NSNotification){
        let result: String = notification.userInfo?["result"] as! String
        if result == successKey {
            let navigationController = UINavigationController(rootViewController: HomeViewController())
            self.present(navigationController, animated: true, completion: nil)
        }else{
            if let error: String = (notification.userInfo?["error"] as! String?){
                CreateAlert.showBasic(self, title: "Error Signing in", message: error)
            }
    
    }
    
    @objc
    func handleSignInClick(sender: ActionButton){
        //guard return lets it act such that if the user does not type in a user or password, the sign in button
        //does nothing
        guard let emailAddress = signInView.emailTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let password = signInView.passwordTextField.text?.trimmingCharacters(in: .whitespaces) else { return }

        do{
            try FirebaseConnection.signInUser(email:emailAddress, password: password)
        }catch LoginError.incompleteForm{
            CreateAlert.showBasic(self, title: "Incomplete Form", message: "Please fill out both password and email")
            return
        }catch LoginError.invalidEmail{
            CreateAlert.showBasic(self, title: "Invalid Email", message: "Email not valid, please try again")
            return
        }catch LoginError.incorrectPasswordLength{
            CreateAlert.showBasic(self, title: "Password too short", message: "Passwords are at least 6 characters")
            return
        }catch {
            CreateAlert.showBasic(self, title: "Error", message: "An unknown error occured")
            return
        }

    }
}
