//
//  WelcomeViewController.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//
import UIKit
class WelcomeViewController: UIViewController {
    lazy var mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    fileprivate func setupView() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        mainView.signinButton.action = {
            self.navigationController?.pushViewController(SignInViewController(), animated: true)
        }
        mainView.signupButton.action = {
            self.navigationController?.pushViewController(SignUpViewController(), animated: true)
        }
        view = mainView
    }
}
