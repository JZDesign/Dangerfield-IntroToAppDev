//
//  WelcomeViewController.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    //lazy such that the navigationBarHeigh can update before view uses the value
    lazy var mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        UIElementSizes.navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        // Do any additional setup after loading the view.
        setupView()
    }

    fileprivate func setupView() {
        //styleistic choice to remove background of navigation controller
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()

        mainView.signinButton.action = handleSignInClick
        mainView.signupButton.action = handleSignUpClick

        view = mainView
    }

    func handleSignInClick() {
        let signInVC = SignInViewController()
        self.navigationController?.pushViewController(signInVC, animated: true)
    }

    func handleSignUpClick() {
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
