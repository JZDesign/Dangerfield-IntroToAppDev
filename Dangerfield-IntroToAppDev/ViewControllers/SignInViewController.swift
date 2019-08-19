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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    fileprivate func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sign in"
        signInView.signinButton.action = handleSignInClick
        view = signInView
    }

    func handleSignInClick() {
        //guard return lets it act such that if the user does not type in a user or password, the sign in button
        //does nothing
        guard let emailAddress = signInView.emailTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let password = signInView.passwordTextField.text?.trimmingCharacters(in: .whitespaces) else { return }

        do {
            //FIXME: CHANGE STUCTURE
            try FirebaseConnection.signInUser(email: emailAddress, password: password, completion: {_, error in
                if let error = error {
                    CreateAlert.showBasic(self, title: "Error Signing In", message: error.localizedDescription)
                    return
                }
                let navigationController = UINavigationController(rootViewController: HomeViewController())
                self.present(navigationController, animated: true, completion: nil)
            })
        }catch LoginError.incompleteForm {
            CreateAlert.showBasic(self, title: "Incomplete Form", message: "Please fill out both password and email")
            return
        }catch LoginError.invalidEmail {
            CreateAlert.showBasic(self, title: "Invalid Email", message: "Email not valid, please try again")
            return
        }catch LoginError.incorrectPasswordLength {
            CreateAlert.showBasic(self, title: "Password too short", message: "Passwords are at least 6 characters")
            return
        }catch {
            CreateAlert.showBasic(self, title: "Error", message: "An unknown error occured")
            return
        }
    }
}
